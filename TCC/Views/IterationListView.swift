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
    
    var body: some View {
        Group {
            if essay.iterations.isEmpty {
                ContentUnavailableView("Adicione sua primeira iteração", systemImage: "text.badge.plus", description: Text("Você pode ter apenas uma iteração em andamento para cada tema de redação. Após a submissão e avaliação, você poderá iniciar uma nova iteração."))
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
        .navigationSubtitle(essay.topic?.title ?? "")
        .navigationDestination(for: EssayIteration.self, destination: { iteration in
            if iteration.isCompleted {
                ResultsView(iteration: iteration)
            } else {
                EditEssayView(iteration: iteration)
            }
        })
        .toolbar {
            ToolbarItem {
                // TODO: implement
                Button("Info", systemImage: "info.circle") { }
            }
            
//            ToolbarSpacer()
            
            ToolbarItem {
                Button("Nova iteração", systemImage: "plus") {
                    withAnimation {
                        createIteration(for: essay)
                    }
                }
            }
        }
    }
    
    private func createIteration(for essay: Essay) {
        // FIXME: throwing?
        guard essay.iterations.allSatisfy({ $0.isCompleted }) else { return }
        
        let newIteration = EssayIteration(essay: essay, date: .now)
        modelContext.insert(newIteration)
        
        try? modelContext.save()
    }
    
    private func deleteIterations(at indexSet: IndexSet) {
        for index in indexSet {
            let iteration = essay.iterations[index]
            modelContext.delete(iteration)
        }
        
        try? modelContext.save()
    }
}

#Preview {
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
        IterationListView(essay: essay)
            .modelContainer(SampleData.shared.modelContainer)
    }
    .preferredColorScheme(.dark)
}
