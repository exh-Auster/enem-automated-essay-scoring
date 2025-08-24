//
//  Score.swift
//  TCC
//
//  Created by Felipe Ribeiro on 09/08/25.
//

import Foundation

enum ScoreValues: Int {
    case zero = 0
    case forty = 40
    case eighty = 80
    case oneTwenty = 120
    case oneSixty = 160
    case twoHundred = 200
}

struct Score {
    var c1: ScoreValues
    var c2: ScoreValues
    var c3: ScoreValues
    var c4: ScoreValues
    var c5: ScoreValues
    
    var total: Int {
        [c1, c2, c3, c4, c5].reduce(0) { $0 + $1.rawValue }
    }
}
