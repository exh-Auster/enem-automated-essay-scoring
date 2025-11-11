//
//  EnemEssayCompetencyClassifier.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import CoreML

protocol EnemEssayCompetencyClassifier {
    associatedtype InputType
    associatedtype OutputType

    func prediction(input: InputType) async throws -> OutputType

    static func makeInput(
        stimulusTextsInputIds: MLMultiArray,
        stimulusTextsAttentionMask: MLMultiArray,
        essayTextInputIds: MLMultiArray,
        essayTextAttentionMask: MLMultiArray
    ) -> InputType

    static func extractLabel(from output: OutputType) -> Int
    static func extractProbs(from output: OutputType) async -> [Double]
}
