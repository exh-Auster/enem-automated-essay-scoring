//
//  IterationReviewView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/08/25.
//

import SwiftUI

struct IterationReviewView: View {
    @Bindable var iteration: EssayIteration
    
    var body: some View {
        ScrollView {
            Text(iteration.fullText)
                .navigationTitle("Revisão")
                .navigationBarTitleDisplayMode(.inline)
                .fontDesign(.serif)
                .padding()
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                // TODO: implement
                NavigationLink {
                    ProgressView()
                } label: {
                    Label("Enviar", systemImage: "arrow.up")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        IterationReviewView(iteration: SampleData.shared.iteration)
    }
}
