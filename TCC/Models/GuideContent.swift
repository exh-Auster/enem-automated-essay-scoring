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
    
    static func url(forPage page: Int) -> URL? {
        URL(string: "\(baseURLString)#page=\(page)")
    }
    
    static let essayExamplesPage = 42
    
    static let competencies: [Competency] = [
        .init(title: "Competência I", description: "Demonstrar domínio da modalidade escrita formal da língua portuguesa", page: 14),
        .init(title: "Competência II", description: "Compreender a proposta de redação e aplicar conceitos das várias áreas de conhecimento para desenvolver o tema dentro dos limites estruturais do texto dissertativo-argumentativo em prosa", page: 16),
        .init(title: "Competência III", description: "Selecionar, relacionar, organizar e interpretar informações, fatos, opiniões e argumentos em defesa de um ponto de vista.", page: 29),
        .init(title: "Competência IV", description: "Demonstrar conhecimento dos mecanismos linguísticos necessários para a construção da argumentação", page: 32),
        .init(title: "Competência V", description: "Elaborar proposta de intervenção para o problema abordado, respeitando os direitos humanos", page: 35),
    ]
}
