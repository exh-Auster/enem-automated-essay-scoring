//
//  TCCApp.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import OSLog
import SwiftData
import SwiftUI
import TipKit

@main
struct TCCApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    if !EnemEssayClassifierPipelineLoader.isReady {
                        await EnemEssayClassifierPipelineLoader.load()
                    }
                }
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            #if DEBUG
            container = SampleData.shared.modelContainer
            #else
            container = try ModelContainer(for: Topic.self, Essay.self, EssayIteration.self)
            #endif
        } catch {
            fatalError("Error creating ModelContainer: \(error.localizedDescription).")
        }
        
        do {
            try setupTips()
        } catch {
            Logger.tips.error("Error initializing TipKit: \(error.localizedDescription)")
        }
    }
    
    private func setupTips() throws {
//        Tips.showAllTipsForTesting()
//        Tips.showTipsForTesting([])
//        Tips.hideAllTipsForTesting()
//        
//        try Tips.resetDatastore()

        try Tips.configure()
    }
}
