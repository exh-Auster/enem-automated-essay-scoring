//
//  GuideContent.swift
//  TCC
//
//  Created by Felipe Ribeiro on 24/10/25.
//

import Foundation

// TODO: confirm approach and move to appropriate location

enum GuideContent {
    static let baseURLString = "https://download.inep.gov.br/publicacoes/institucionais/avaliacoes_e_exames_da_educacao_basica/a_redacao_no_enem_2025_cartilha_do_participante.pdf"
    
    static let essayExamplePages = [
        43, 46, 49, 52, 55, 58, 61, 64, 67, 70
    ]
    
    static func url(forPage page: Int) -> URL? {
        URL(string: "\(baseURLString)#page=\(page)")
    }
}
