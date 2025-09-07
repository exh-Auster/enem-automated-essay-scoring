//
//  ResultsView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 20/08/25.
//

import SwiftUI
import Tokenizers

struct ResultsView: View {
    let iteration: EssayIteration
    var isFirstPresentation: Bool = false
    
    @Binding var path: NavigationPath
    
    // TODO: remove
    let scores = [40, 80, 120, 160, 200]
    
    var body: some View {
        VStack {
            ScoreBadgeView(type: .totalLarge, score: scores.reduce(0, +))
            
            HStack {
                ForEach(scores.indices, id: \.self) {
                    ScoreBadgeView(label: "C\($0 + 1)", score: scores[$0])
                }
            }
            
            Spacer()
        }
        .navigationTitle("Resultados")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(isFirstPresentation)
        .toolbar {
            if isFirstPresentation {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button("Concluir", systemImage: "chevron.left") {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Concluir", systemImage: "checkmark") {
                        path.removeLast(path.count - 1)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    
    NavigationStack {
        ResultsView(iteration: SampleData.shared.iteration, path: $path)
    }
}
