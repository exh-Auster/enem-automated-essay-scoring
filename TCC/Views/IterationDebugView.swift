//
//  IterationDebugView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 15/09/25.
//

import SwiftUI
import NaturalLanguage

struct IterationDebugView: View {
    let iteration: EssayIteration
    
    @State private var encodedPrompt: [Int] = []
    @State private var tokenized: [String] = []
    @State private var encoded: [Int] = []
    @State private var decoded: String = ""
    
    @State private var possibleLanguages: [(key: NLLanguage, value: Double)] = []
    
    var body: some View {
        List {
            Section("# of tokens") {
                Text("Prompt: \(encodedPrompt.count)")
                Text("Essay: \(encoded.count)")
                    .foregroundStyle(encoded.count > 512 ? .red : .primary)
                Text("Total: \(encodedPrompt.count + encoded.count)")
                    .foregroundStyle((encodedPrompt.count + encoded.count) > 512 ? .red : .primary)
            }
            
            if !possibleLanguages.isEmpty {
                Section("Possible languages") {
                    ForEach(possibleLanguages, id: \.key) { language in
                        HStack {
                            Text(language.key.rawValue)
                            
                            Spacer()
                            
                            Text(language.value, format: .percent.precision(.fractionLength(6)))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            
            Section("Tokenized") {
                Text(tokenized.description)
            }
            
            Section("Encoded") {
                Text(encoded.description)
            }
            
            Section("Decoded") {
                Text(decoded)
            }
        }
        .fontDesign(.monospaced)
        .fontWeight(.light)
        .fontWidth(.compressed)
        .navigationTitle("Debug")
        .onAppear {
            self.possibleLanguages = getlanguageHypotheses(for: iteration.fullText)
        }
    }
    
    func getlanguageHypotheses(for text: String) -> [(NLLanguage, Double)] {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        
        return recognizer.languageHypotheses(withMaximum: 10).sorted { $0.value > $1.value }
    }
}

#Preview {
    IterationDebugView(iteration: SampleData.shared.iteration)
}
