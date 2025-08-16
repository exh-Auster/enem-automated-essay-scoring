//
//  ContentView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            Tab("Redações", systemImage: "book.pages.fill") {
                NavigationStack {
                    EssayListView()
                }
            }
            
            Tab("Estatísticas", systemImage: "chart.bar.fill") {
                Text("WIP")
            }
            
            Tab("Pesquisar", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    ContentUnavailableView.search
                }
                .searchable(text: $searchText)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
