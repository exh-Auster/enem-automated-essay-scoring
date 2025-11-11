//
//  CreateEssayView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 15/08/25.
//

import SwiftUI
import SwiftData

struct CreateEssayView: View {
    @Query var essays: [Essay]
    
    @State private var newEssay: Essay?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    private var availableTopics: [Topic] {
        let usedTopics = essays.map { $0.topic }
        
        return Topic.topics.filter { !usedTopics.contains($0) }
    }
    
    var body: some View {
        Group {
            switch availableTopics.isEmpty {
            case true:
                ContentUnavailableView(
                    "Sem temas disponíveis",
                    systemImage: "tray",
                    description: Text("Você adicionou todos os temas de redação.\nPara criar uma nova iteração, abra um tema e toque no botão \(Image(systemName: "plus.circle")).")
                )
            case false:
                List {
                    Section("Temas disponíveis") {
                        ForEach(availableTopics) { topic in
                            Button {
                                createEssay(topic: topic)
                                dismiss()
                            } label: {
                                TopicRowView(topic: topic)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .navigationTitle("Nova redação")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $newEssay) { Text($0.topic?.title ?? "")
        }
        .toolbar {
            Button(role: .cancel) {
                dismiss()
            }
        }
    }
    
    private func createEssay(topic: Topic) {
        let newEssay = Essay(topic: topic) // TODO: fix
        
        modelContext.insert(newEssay)
        try? modelContext.save()
    }
}

#Preview {
    Text("CreateEssayView preview")
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                CreateEssayView()
                    .modelContainer(SampleData.shared.modelContainer)
            }
        }
}
