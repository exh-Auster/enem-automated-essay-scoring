//
//  EssayIteration.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import Foundation
import SwiftData

@Model
class EssayIteration {
    var essay: Essay?
    
    var date: Date
    var text: String
    
    init(essay: Essay, date: Date, text: String) {
        self.essay = essay
        self.date = date
        self.text = text
    }
}
