//
//  EnemEssayClassifier+EnemEssayCompetencyClassifier.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import CoreML

extension EnemEssayC1Classifier: EnemEssayCompetencyClassifier {
    typealias InputType = EnemEssayC1ClassifierInput
    typealias OutputType = EnemEssayC1ClassifierOutput

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> EnemEssayC1ClassifierInput {
        EnemEssayC1ClassifierInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
    }

    static func extractLabel(from output: EnemEssayC1ClassifierOutput) -> Int {
        Int(output.classLabel)
    }
    
    static func extractProbs(from output: EnemEssayC1ClassifierOutput) async -> [Double] {
        let logits = output.classLabel_probs.sorted(by: { $0.key < $1.key }).map { Float($0.value) }
        let probs = await MLTensor(logits).softmax().shapedArray(of: Float.self).scalars.map {
            Double($0)
        }
        
        return probs
    }
}

extension EnemEssayC2Classifier: EnemEssayCompetencyClassifier {
    typealias InputType = EnemEssayC2ClassifierInput
    typealias OutputType = EnemEssayC2ClassifierOutput

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> EnemEssayC2ClassifierInput {
        EnemEssayC2ClassifierInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
    }

    static func extractLabel(from output: EnemEssayC2ClassifierOutput) -> Int {
        Int(output.classLabel)
    }
    
    static func extractProbs(from output: EnemEssayC2ClassifierOutput) async -> [Double] {
        let logits = output.classLabel_probs.sorted(by: { $0.key < $1.key }).map { Float($0.value) }
        let probs = await MLTensor(logits).softmax().shapedArray(of: Float.self).scalars.map {
            Double($0)
        }
        
        return probs
    }
}

extension EnemEssayC3Classifier: EnemEssayCompetencyClassifier {
    typealias InputType = EnemEssayC3ClassifierInput
    typealias OutputType = EnemEssayC3ClassifierOutput

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> EnemEssayC3ClassifierInput {
        EnemEssayC3ClassifierInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
    }

    static func extractLabel(from output: EnemEssayC3ClassifierOutput) -> Int {
        Int(output.classLabel)
    }
    
    static func extractProbs(from output: EnemEssayC3ClassifierOutput) async -> [Double] {
        let logits = output.classLabel_probs.sorted(by: { $0.key < $1.key }).map { Float($0.value) }
        let probs = await MLTensor(logits).softmax().shapedArray(of: Float.self).scalars.map {
            Double($0)
        }
        
        return probs
    }
}

extension EnemEssayC4Classifier: EnemEssayCompetencyClassifier {
    typealias InputType = EnemEssayC4ClassifierInput
    typealias OutputType = EnemEssayC4ClassifierOutput

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> EnemEssayC4ClassifierInput {
        EnemEssayC4ClassifierInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
    }

    static func extractLabel(from output: EnemEssayC4ClassifierOutput) -> Int {
        Int(output.classLabel)
    }
    
    static func extractProbs(from output: EnemEssayC4ClassifierOutput) async -> [Double] {
        let logits = output.classLabel_probs.sorted(by: { $0.key < $1.key }).map { Float($0.value) }
        let probs = await MLTensor(logits).softmax().shapedArray(of: Float.self).scalars.map {
            Double($0)
        }
        
        return probs
    }
}

extension EnemEssayC5Classifier: EnemEssayCompetencyClassifier {
    typealias InputType = EnemEssayC5ClassifierInput
    typealias OutputType = EnemEssayC5ClassifierOutput

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> EnemEssayC5ClassifierInput {
        EnemEssayC5ClassifierInput(
            stimulusTextsInputIds: stimulusTextsInputIds,
            stimulusTextsAttentionMask: stimulusTextsAttentionMask,
            essayTextInputIds: essayTextInputIds,
            essayTextAttentionMask: essayTextAttentionMask
        )
    }

    static func extractLabel(from output: EnemEssayC5ClassifierOutput) -> Int {
        Int(output.classLabel)
    }
    
    static func extractProbs(from output: EnemEssayC5ClassifierOutput) async -> [Double] {
        let logits = output.classLabel_probs.sorted(by: { $0.key < $1.key }).map { Float($0.value) }
        let probs = await MLTensor(logits).softmax().shapedArray(of: Float.self).scalars.map {
            Double($0)
        }
        
        return probs
    }
}
