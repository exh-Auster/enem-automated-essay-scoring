//
//  EssayListView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 29/07/25.
//

import SwiftData
import SwiftUI

struct EssayListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Essay.creationDate, order: .reverse, animation: .bouncy) var essays: [Essay] // FIXME: sorting criteria
    
    @State private var showingCreateEssaySheet = false
    @State private var isShowingSettings = false
    
    @State private var selectedEssay: Essay?
    
    @Binding var path: NavigationPath
    
    var body: some View {
        Group {
            if essays.isEmpty {
                ContentUnavailableView {
                    Label("Adicione sua primeira redação", systemImage: "list.bullet")
                } description: {
                    Text("Escolha um dos temas disponíveis das edições anteriores do Enem e comece a escrever.")
                } actions: {
                    Button {
                        showingCreateEssaySheet = true
                    } label: {
                        Label("Adicionar redação", systemImage: "plus")
                    }
                    .buttonStyle(.glassProminent)
                }
            } else {
                List {
                    ForEach(essays) { essay in
                        NavigationLink(value: essay) {
                            TopicRowView(topic: essay.topic!)
                        }
                        .badge(essay.iterations.count)
                    }
                    .onDelete(perform: deleteEssays)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Configurações", systemImage: "gear") {
                    isShowingSettings = true
                }
            }
            
            ToolbarSpacer(placement: .topBarTrailing)
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingCreateEssaySheet = true
                } label: {
                    Label("Nova redação", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isShowingSettings) {
            NavigationStack {
                SettingsView()
            }
        }
        .navigationTitle("Redações")
        .navigationDestination(for: Essay.self, destination: { IterationListView(essay: $0, path: $path) })
        .sheet(isPresented: $showingCreateEssaySheet) {
            NavigationStack {
                CreateEssayView()
            }
        }
    }
    
    private func deleteEssays(at indexSet: IndexSet) {
        for index in indexSet {
            let essay = essays[index]
            modelContext.delete(essay)
        }
        
        try? modelContext.save()
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    
    NavigationStack {
        EssayListView(path: $path)
            .modelContainer(SampleData.shared.modelContainer)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
