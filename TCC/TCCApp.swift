//
//  TCCApp.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftData
import SwiftUI

@main
struct TCCApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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
    }
}
