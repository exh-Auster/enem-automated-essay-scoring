//
//  Essay.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import Foundation
import SwiftData

@Model
class Essay {
    var topic: Topic?
    var iterations: [EssayIteration]? = []
    var creationDate: Date? = Date.now
    
    var maxIterations = 0
    
    init(topic: Topic, iterations: [EssayIteration] = []) {
        self.topic = topic
        self.iterations = iterations
    }
}

extension Essay {
//    static let sampleData = Topic.topics.map { topic in
//        Essay(topic: topic)
//    }
    
    static var sampleData: [Essay] {
        (1..<5).map { Essay(topic: Topic.topics[$0]) }
    }
}
