//
//  IterationReviewView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/08/25.
//

import SwiftUI

struct IterationReviewView: View {
    @Bindable var iteration: EssayIteration
    @State private var isSubmitted = false
    
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
                Button {
                    // TODO: implement
                    iteration.submissionDate = .now
                    isSubmitted = true
                } label: {
                    Label("Enviar", systemImage: "arrow.up")
                }
            }
        }
        .navigationDestination(isPresented: $isSubmitted) {
            // TODO: implement
            ProgressView()
        }
    }
}

#Preview {
    NavigationStack {
        IterationReviewView(iteration: SampleData.shared.iteration)
    }
}
