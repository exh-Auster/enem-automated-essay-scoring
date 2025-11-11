//
//  BERTimbauTokenizer.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import Foundation
import Tokenizers

class BERTimbauTokenizer {
    static var shared: BERTimbauTokenizer?
    
    let tokenizer: Tokenizer
    
    private init(tokenizer: Tokenizer) {
        self.tokenizer = tokenizer
    }
    
    static func makeShared() async throws {
        guard let tokenizerFileURL = Bundle.main.url(forResource: "tokenizer", withExtension: "json") else {
            fatalError("Tokenizer files not found in bundle")
        }
        
        let tokenizerFolderURL = tokenizerFileURL.deletingLastPathComponent()
        
        do {
            let tokenizer = try await AutoTokenizer.from(modelFolder: tokenizerFolderURL)
            shared = BERTimbauTokenizer(tokenizer: tokenizer)
        } catch {
            fatalError("Error creating tokenizer: \(error.localizedDescription)")
        }
    }
}
