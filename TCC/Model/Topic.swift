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
    var source: String?
    var essays: [Essay] = []
    
    init(title: String, source: String? = nil, essays: [Essay] = []) {
        self.title = title
        self.source = source
        self.essays = essays
    }
}

extension Topic {
    static var topics: [Topic] = [
        Topic(title: "Desafios para a valorização da herança africana no Brasil", source: "ENEM 2024"),
        Topic(title: "Desafios para o enfrentamento da invisibilidade do trabalho de cuidado realizado pela mulher no Brasil", source: "ENEM 2023"),
        Topic(title: "Os desafios para a valorização das comunidades e povos tradicionais do Brasil", source: "ENEM 2022"),
        Topic(title: "Invisibilidade e registro civil: garantia de acesso à cidadania no Brasil", source: "ENEM 2021"),
        Topic(title: "O estigma associado às doenças mentais na sociedade brasileira", source: "ENEM 2020"),
        Topic(title: "Democratização do acesso ao cinema no Brasil", source: "ENEM 2019"),
        Topic(title: "Manipulação do comportamento do usuário pelo controle de dados na internet", source: "ENEM 2018"),
        Topic(title: "Desafios para a formação educacional de surdos no Brasil", source: "ENEM 2017"),
        Topic(title: "Caminhos para combater a intolerância religiosa no Brasil", source: "ENEM 2016"),
        Topic(title: "A persistência da violência contra a mulher na sociedade brasileira", source: "ENEM 2015"),
        Topic(title: "Publicidade infantil em questão no Brasil", source: "ENEM 2014"),
        Topic(title: "Efeitos da implantação da Lei Seca no Brasil", source: "ENEM 2013"),
        Topic(title: "Movimento imigratório para o Brasil no século 21", source: "ENEM 2012"),
        Topic(title: "Viver em rede no século 21: os limites entre o público e o privado", source: "ENEM 2011"),
        Topic(title: "O trabalho na construção da dignidade humana", source: "ENEM 2010"),
    ]
}
