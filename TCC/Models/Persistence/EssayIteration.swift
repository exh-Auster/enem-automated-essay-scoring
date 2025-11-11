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
    var creationDate: Date
    var submissionDate: Date?
    var paragraphs: [String] = []
    
    var numericID: Int
    
    var c1Class: Int?
    var c1Probs: [Double]?
    
    var c2Class: Int?
    var c2Probs: [Double]?
    
    var c3Class: Int?
    var c3Probs: [Double]?
    
    var c4Class: Int?
    var c4Probs: [Double]?
    
    var c5Class: Int?
    var c5Probs: [Double]?
    
    var scores: [Int]? {
        guard let c1Class, let c2Class, let c3Class, let c4Class, let c5Class else { return nil }
        
        return [c1Class, c2Class, c3Class, c4Class, c5Class].map { $0 * 40 }
    }
    
    var totalScore: Int? {
        guard let scores else { return nil }
        
        return scores.reduce(0, +)
    }
    
    init(essay: Essay? = nil, date: Date, paragraphs: [String] = []) {
        self.essay = essay
        self.creationDate = date
        self.paragraphs = paragraphs
        
        if let essay {
            numericID = essay.maxIterations
            essay.maxIterations += 1
        } else {
            numericID = 0
        }
    }
}

extension EssayIteration {
    var isCompleted: Bool {
        submissionDate != nil
    }
    
    var fullText: String {
        get {
            paragraphs.joined(separator: "\n\n")
        }
        
        set {
            paragraphs = newValue.components(separatedBy: .newlines).filter({ !$0.isEmpty })
        }
    }
    
    var wordCount: Int {
        fullText
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .count
    }
    
    var paragraphCount: Int {
        paragraphs.count
    }
    
    func getWordCountForParagraph(at index: Int) -> Int? {
        guard index < paragraphs.count else { return nil }
        
        return paragraphs[index].components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }.count
    }
}

extension EssayIteration {
    static var sampleData = [
        EssayIteration(
            essay: Essay(topic: Topic.topics.first!),
            date: Date.now,
            paragraphs: [
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.",
                "Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi.",
                "Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui.",
                "Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh."
            ]
        )
    ]
}
