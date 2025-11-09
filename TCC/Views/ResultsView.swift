//
//  ResultsView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 20/08/25.
//

import SwiftUI

struct ResultsView: View {
    @AppStorage("debugEnabled") var debugEnabled = false
    
    let iteration: EssayIteration
    var isFirstPresentation: Bool = false
    
    @Binding var path: NavigationPath
    
    // TODO: remove
    let scores = [40, 80, 120, 160, 200]
    
    var body: some View {
        Group {
            VStack {
                ScoreBadgeView(type: .totalLarge, score: iteration.totalScore ?? -1)
                
                HStack {
                    ForEach((iteration.scores ?? [-1, -1, -1, -1, -1]).enumerated(), id: \.offset) { index, cls in
                        ScoreBadgeView(label: "C\(index + 1)", score: cls)
                    }
                }
                
                TabView {
                    ForEach(Competency.competencies) { competency in
                        Tab {
                            ScrollView {
                                Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 10) {
                                    GridRow {
                                        Text("Nível")
                                        Text("Descrição")
                                    }
                                    .fontWeight(.semibold)
                                    
                                    Divider().gridCellColumns(2)
                                    
                                    ForEach(competency.levels, id: \.0) { level in
                                        GridRow {
                                            Text("\(level.0)")
                                            Text(level.1)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .ignoresSafeArea(.all)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(maxHeight: .infinity)
            }
        }
        .navigationTitle("Resultados")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(isFirstPresentation)
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
            
            if isFirstPresentation {
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
