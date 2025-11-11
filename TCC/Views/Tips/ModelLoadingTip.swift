//
//  ModelLoadingTip.swift
//  TCC
//
//  Created by Felipe Ribeiro on 09/11/25.
//

import TipKit

struct ModelLoadingTip: Tip {
    @Parameter
    static var modelsLoading: Bool = false
    
    var title: Text {
        Text("Terminando de Carregar os Modelos")
            .foregroundStyle(Color.accentColor)
    }
    
    var message: Text? {
        Text("Aguarde um momento enquanto os modelos terminam de carregar.")
    }
    
    var image: Image? {
        Image(systemName: "sparkles.2")
    }
    
    var rules: [Rule] {
        #Rule(Self.$modelsLoading) {
            $0 == true
        }
    }
}
