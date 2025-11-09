//
//  EnemEssayClassifierPipelineLoader.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import Foundation

@Observable
class EnemEssayClassifierPipelineLoader {
    static var isReady = false
    
    static func load() async {
        try? await BERTimbauTokenizer.makeShared()
        try? await EnemEssayClassifierPipeline.makeShared()
        isReady = true
    }
}
