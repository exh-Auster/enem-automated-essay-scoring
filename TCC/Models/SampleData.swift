//
//  SampleData.swift
//  TCC
//
//  Created by Felipe Ribeiro on 10/08/25.
//

import Foundation
import SwiftData

class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var essay: Essay {
        Essay.sampleData.first!
    }
    
    var iteration: EssayIteration {
        EssayIteration.sampleData.first!
    }
    
    private init() {
        let schema = Schema([
            Topic.self,
            Essay.self,
            EssayIteration.self,
//            Score.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
//        for topic in Topic.topics {
//            context.insert(topic)
//        }
        
        for essay in Essay.sampleData {
            essay.iterations.append(iteration)
            context.insert(essay)
        }
        
//        for iteration in EssayIteration.sampleData {
//            context.insert(iteration)
//        }
    }
}
