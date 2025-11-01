//
//  StimulusTextsView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 31/10/25.
//

import SwiftUI

struct StimulusTextsView: View {
    let stimulusTexts: [[String: String]]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(stimulusTexts, id: \.self) { stimulusText in
                    Section {
                        let body = stimulusText["body", default: ""]
                        Text(body)
                            .fontDesign(body.contains("|-") ? .monospaced : .serif)
                    } header: {
                        Text(stimulusText["title", default: ""])
                    } footer: {
                        Text(stimulusText["source", default: ""])
                    }
                }
                .listSectionSpacing(10)
            }
            .navigationTitle("Textos de Apoio")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(role: .close) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    Text("StimulusTextsView preview")
        .sheet(isPresented: .constant(true)) {
            StimulusTextsView(stimulusTexts: Topic.topics.first!.stimulusTexts)
        }
}
