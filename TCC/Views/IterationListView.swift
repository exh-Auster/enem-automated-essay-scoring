//
//  IterationListView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 29/07/25.
//

import SwiftUI
import SwiftData

struct IterationListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var essay: Essay
    
    @Binding var path: NavigationPath
    
    @State private var isShowingStimulusTextsSheet = false
    
    var body: some View {
        Group {
            if essay.iterations.isEmpty {
                ContentUnavailableView {
                    Label("Adicione sua primeira iteração", systemImage: "text.badge.plus")
                } description: {
                    Text("Você pode ter apenas uma iteração em andamento para cada tema de redação. Após a submissão e avaliação, você poderá iniciar uma nova iteração.")
                } actions: {
                    Button {
                        withAnimation {
                            createIteration(for: essay)
                        }
                    } label: {
                        Label("Adicionar iteração", systemImage: "plus")
                    }
                    .buttonStyle(.glassProminent)
                }
            } else {
                List {
                    if !essay.iterations.filter( { !$0.isCompleted } ).isEmpty {
                        Section("Em progresso") {
                            ForEach(essay.iterations.filter { $0.isCompleted == false } ) { iteration in
                                NavigationLink(value: iteration) {
                                    IterationRow(iteration: iteration)
                                }
                            }
                        }
                    }
                    
                    if !essay.iterations.filter(\.isCompleted).isEmpty {
                        Section("Avaliadas") {
                            ForEach(essay.iterations.filter(\.isCompleted)) { iteration in
                                NavigationLink(value: iteration) {
                                    IterationRow(iteration: iteration)
                                }
                            }
                            .onDelete(perform: deleteIterations)
                        }
                    }
                }
            }
        }
        .navigationTitle("Iterações")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .top) {
            EssayHeader(title: essay.topic?.title ?? "")
        }
        .navigationDestination(for: EssayIteration.self, destination: { iteration in
            if iteration.isCompleted {
                ResultsView(iteration: iteration, path: $path)
            } else {
                EditEssayView(iteration: iteration, path: $path)
            }
        })
        .toolbar {
            ToolbarItem {
                Button {
                    isShowingStimulusTextsSheet = true
                } label: {
                    Label("Textos Motivadores", systemImage: "info.circle")
                }
            }
            
            ToolbarSpacer()
            
            ToolbarItem {
                Button("Nova iteração", systemImage: "plus") {
                    withAnimation {
                        createIteration(for: essay)
                    }
                }
                .disabled(!(essay.iterations.last?.isCompleted ?? true))
            }
        }
        .sheet(isPresented: $isShowingStimulusTextsSheet) {
            StimulusTextsView(stimulusTexts: essay.topic?.stimulusTexts ?? [])
        }
    }
    
    private func createIteration(for essay: Essay) {
        // FIXME: throwing?
        guard essay.iterations.allSatisfy({ $0.isCompleted }) else { return }
        
        let newIteration = EssayIteration(essay: essay, date: .now)
        modelContext.insert(newIteration)
        
        try? modelContext.save()
        
        path.append(newIteration)
    }
    
    private func deleteIterations(at indexSet: IndexSet) {
        for index in indexSet {
            let iteration = essay.iterations[index]
            modelContext.delete(iteration)
        }
        
        try? modelContext.save()
    }
}

#Preview("Populated") {
    @Previewable @State var path = NavigationPath()
    // TODO: fix preview data
    
    let iterations = (0..<15).map { _ in
        EssayIteration(
            date: .now,
            paragraphs: ["IterationRow test"]
        )
    }
    
    let essay = Essay(
        topic: Topic.topics.first!,
        iterations: iterations
    )
    
    NavigationStack {
        IterationListView(essay: essay, path: $path)
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty") {
    @Previewable @State var path = NavigationPath()
    
    let essay = Essay(topic: Topic.topics.first!)
    
    NavigationStack {
        IterationListView(essay: essay, path: $path)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
