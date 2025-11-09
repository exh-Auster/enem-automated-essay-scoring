//
//  IterationReviewView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/08/25.
//

import SwiftUI

struct IterationReviewView: View {
    @AppStorage("debugEnabled") var debugEnabled = false
    
    @Bindable var iteration: EssayIteration
    
    @State private var isLoading = false
    @State private var isSubmitted = false
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            Text(iteration.fullText)
                .navigationTitle("Revisão")
                .navigationBarTitleDisplayMode(.inline)
                .fontDesign(.serif)
                .padding()
        }
        .toolbar {
            if debugEnabled {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        IterationDebugView(iteration: iteration)
                    } label: {
                        Label("Debug", systemImage: "ant")
                    }
                    // TODO: conditionally disable
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    Task {
                        await rateEssay()
                    }
                } label: {
                    if isLoading {
                        ProgressView()
                    } else {
                        Label("Enviar", systemImage: "arrow.up")
                    }
                }
            }
        }
        .navigationDestination(isPresented: $isSubmitted) {
            ResultsView(iteration: iteration, isFirstPresentation: true, path: $path)
        }
    }
    
    private func rateEssay() async {
        isLoading = true
        
        while EnemEssayClassifierPipeline.shared == nil {
            try? await Task.sleep(for: .milliseconds(100))
        }
        
        guard let pipeline = EnemEssayClassifierPipeline.shared else { return }
        
        ((iteration.c1Class, iteration.c1Probs),
        (iteration.c2Class, iteration.c2Probs),
        (iteration.c3Class, iteration.c3Probs),
        (iteration.c4Class, iteration.c4Probs),
        (iteration.c5Class, iteration.c5Probs)) = await pipeline.rate(iteration)
        
        iteration.submissionDate = .now
        isSubmitted = true
        isLoading = false
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    
    NavigationStack {
        IterationReviewView(iteration: SampleData.shared.iteration, path: $path)
    }
}
