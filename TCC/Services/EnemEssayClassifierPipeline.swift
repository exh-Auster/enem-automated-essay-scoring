//
//  EnemEssayClassifierPipeline.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import CoreML
import Foundation
import Tokenizers

class EnemEssayClassifierPipeline {
    static var shared: EnemEssayClassifierPipeline?
    
    let c1Classifier: EnemEssayC1Classifier
    let c2Classifier: EnemEssayC2Classifier
    let c3Classifier: EnemEssayC3Classifier
    let c4Classifier: EnemEssayC4Classifier
    let c5Classifier: EnemEssayC5Classifier
    
    private init(c1Classifier: EnemEssayC1Classifier, c2Classifier: EnemEssayC2Classifier, c3Classifier: EnemEssayC3Classifier, c4Classifier: EnemEssayC4Classifier, c5Classifier: EnemEssayC5Classifier) {
        self.c1Classifier = c1Classifier
        self.c2Classifier = c2Classifier
        self.c3Classifier = c3Classifier
        self.c4Classifier = c4Classifier
        self.c5Classifier = c5Classifier
    }
    
    static func makeShared() async throws {
        print("Started loading models...")
        let startTime = Date.now
        
        let c1Model = try await EnemEssayC1Classifier.load()
        let c1Time = Date.now
        let c1Duration = c1Time.timeIntervalSince(startTime)
        print("C1 model loaded in \(String(format: "%.2f", c1Duration)) seconds")
        
        let c2Model = try await EnemEssayC2Classifier.load()
        let c2Time = Date.now
        let c2Duration = c2Time.timeIntervalSince(c1Time)
        print("C2 model loaded in \(String(format: "%.2f", c2Duration)) seconds")
        
        let c3Model = try await EnemEssayC3Classifier.load()
        let c3Time = Date.now
        let c3Duration = c3Time.timeIntervalSince(c2Time)
        print("C3 model loaded in \(String(format: "%.2f", c3Duration)) seconds")
        
        let c4Model = try await EnemEssayC4Classifier.load()
        let c4Time = Date.now
        let c4Duration = c4Time.timeIntervalSince(c3Time)
        print("C4 model loaded in \(String(format: "%.2f", c4Duration)) seconds")
        
        let c5Model = try await EnemEssayC5Classifier.load()
        let c5Time = Date.now
        let c5Duration = c5Time.timeIntervalSince(c4Time)
        print("C5 model loaded in \(String(format: "%.2f", c5Duration)) seconds")
        
        let totalTime = c1Duration + c2Duration + c3Duration + c4Duration + c5Duration
        print("Finished loading models in \(String(format: "%.2f", totalTime)) seconds")
        
        shared = EnemEssayClassifierPipeline(c1Classifier: c1Model, c2Classifier: c2Model, c3Classifier: c3Model, c4Classifier: c4Model, c5Classifier: c5Model)
    }
    
    private func tokenize(_ text: String) -> (inputIds: MLMultiArray, attentionMask: MLMultiArray) {
        guard let tokenizer = BERTimbauTokenizer.shared?.tokenizer else { return (MLMultiArray(), MLMultiArray()) }
        
        // TODO: remove force unwrapping
        let inputIds = try! MLMultiArray(shape: [1, NSNumber(value: 512)], dataType: .int32)
        let attentionMask = try! MLMultiArray(shape: [1, NSNumber(value: 512)], dataType: .int32)
        
        let encodedText = tokenizer.encode(text: text)
        
        for (i, token) in encodedText.enumerated() {
            if i > 511 {
                print("Triggered truncation with \(encodedText.count - i) tokens remaining")
                break
            }
            
            inputIds[i] = NSNumber(value: token)
            attentionMask[i] = 1
        }
        
        if encodedText.count < attentionMask.count {
            for i in encodedText.count..<attentionMask.count {
                inputIds[i] = 0
                attentionMask[i] = 0
            }
        }

        
        print(inputIds.debugDescription)
        print(attentionMask.debugDescription)
        
        return (inputIds, attentionMask)
    }
    
    private func predict<M: EnemEssayCompetencyClassifier>(
        using model: M,
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) async throws -> (label: Int, probs: [Double]) {
        let input = M.makeInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        let output = try await model.prediction(input: input)
        
        return await (M.extractLabel(from: output), M.extractProbs(from: output))
    }
    
    func rate(_ iteration: EssayIteration) async -> (
        c1: (score: Int, probs: [Double]),
        c2: (score: Int, probs: [Double]),
        c3: (score: Int, probs: [Double]),
        c4: (score: Int, probs: [Double]),
        c5: (score: Int, probs: [Double]),
    ) {        
        let stimulusTexts = iteration.essay?.topic?.stimulusTexts.map { stimulusText in
            stimulusText.values
        }
        
        let (stimulusTextsInputIds, stimulusTextsAttentionMask) = tokenize(stimulusTexts?.description ?? "")
        let (essayTextInputIds, essayTextAttentionMask) = tokenize(iteration.fullText)
        
        // TODO: remove force unwrapping
        async let (c1Label, c1Probs) = try! predict(
            using: c1Classifier,
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        async let (c2Label, c2Probs) = try! predict(
            using: c2Classifier,
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        async let (c3Label, c3Probs) = try! predict(
            using: c3Classifier,
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        async let (c4Label, c4Probs) = try! predict(
            using: c4Classifier,
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        async let (c5Label, c5Probs) = try! predict(
            using: c5Classifier,
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
        
        return await (
            (c1Label, c1Probs),
            (c2Label, c2Probs),
            (c3Label, c3Probs),
            (c4Label, c4Probs),
            (c5Label, c5Probs),
        )
    }
}
