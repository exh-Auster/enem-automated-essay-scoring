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
    var iterations: [EssayIteration] = []
    
    init(topic: Topic, iterations: [EssayIteration] = []) {
        self.topic = topic
        self.iterations = iterations
    }
}

