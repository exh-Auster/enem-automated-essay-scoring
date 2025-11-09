//
//  PendingScoreTip.swift
//  TCC
//
//  Created by Felipe Ribeiro on 09/11/25.
//

import TipKit

struct PendingScoreTip: Tip {
    static let hasSeenIteration = Event(id: "hasSeenIteration")
    
    var title: Text {
        Text("Sua Nota")
            .foregroundStyle(Color.accentColor)
    }
    
    var message: Text? {
        Text("Após a avaliação, a nota total da sua redação aparecerá aqui. Você também poderá consultar as notas individuais de cada competência.")
    }
    
    var image: Image? {
        Image(systemName: "sparkles.2")
    }
    
    var rules: [Rule] {
        #Rule(Self.hasSeenIteration) { $0.donations.count == 0 }
    }
}
