//
//  ContentView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        TabView {
            Tab("Redações", systemImage: "book.pages.fill") {
                NavigationStack(path: $path) {
                    EssayListView(path: $path)
                }
            }
            
            Tab("Guia", systemImage: "text.book.closed") {
                Text("WIP")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
