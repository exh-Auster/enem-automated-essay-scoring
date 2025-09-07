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
    @State private var selectedEssay: Essay?
    
    @Binding var path: NavigationPath
    
    var body: some View {
        Group {
            if essays.isEmpty {
                // TODO: copy
                ContentUnavailableView("No essays", systemImage: "questionmark")
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
        .background(Color(.systemGroupedBackground)) // TODO: confirm
//        .background(.background)
        .navigationTitle("Redações")
//        .toolbarTitleDisplayMode(.inlineLarge)
        .navigationDestination(for: Essay.self, destination: { IterationListView(essay: $0, path: $path) })
        .sheet(isPresented: $showingCreateEssaySheet) {
            NavigationStack {
                CreateEssayView()
//                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showingCreateEssaySheet = true
                } label: {
                    Label("Nova redação", systemImage: "plus")
                }
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
