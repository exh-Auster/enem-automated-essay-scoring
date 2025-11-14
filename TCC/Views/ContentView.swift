//
//  ContentView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import AppIntents
import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("needsOnboarding") var needsOnboarding = true
    
    @State private var path = NavigationPath()
    @State private var selectedTab: NavigationOption = .essays
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Redações", systemImage: "book.pages", value: .essays) {
                NavigationStack(path: $path) {
                    EssayListView(path: $path)
                }
            }
            
            Tab("Guia", systemImage: "text.book.closed", value: .guide) {
                GuideView()
            }
        }
        .fullScreenCover(isPresented: $needsOnboarding) {
            OnboardingView()
        }
        .onAppIntentExecution(NavigateIntent.self) { intent in
            selectedTab = intent.navigationOption
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
