//
//  Topic.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import Foundation
import SwiftData

@Model
class Topic {
    var title: String
    var essays: [Essay] = []
    
    init(title: String, essays: [Essay] = []) {
        self.title = title
        self.essays = essays
    }
}

extension Topic {
    static var topics: [Topic] = [
        Topic(title: "Desafios para a valorização da herança africana no Brasil"),
        Topic(title: "Desafios para o enfrentamento da invisibilidade do trabalho de cuidado realizado pela mulher no Brasil"),
        Topic(title: "Os desafios para a valorização das comunidades e povos tradicionais do Brasil"),
        Topic(title: "Invisibilidade e registro civil: garantia de acesso à cidadania no Brasil"),
        Topic(title: "O estigma associado às doenças mentais na sociedade brasileira"),
        Topic(title: "Democratização do acesso ao cinema no Brasil"),
        Topic(title: "Manipulação do comportamento do usuário pelo controle de dados na internet"),
        Topic(title: "Desafios para a formação educacional de surdos no Brasil"),
        Topic(title: "Caminhos para combater a intolerância religiosa no Brasil"),
        Topic(title: "A persistência da violência contra a mulher na sociedade brasileira"),
        Topic(title: "Publicidade infantil em questão no Brasil"),
        Topic(title: "Efeitos da implantação da Lei Seca no Brasil"),
        Topic(title: "Movimento imigratório para o Brasil no século 21"),
        Topic(title: "Viver em rede no século 21: os limites entre o público e o privado"),
        Topic(title: "O trabalho na construção da dignidade humana"),
    ]
}
