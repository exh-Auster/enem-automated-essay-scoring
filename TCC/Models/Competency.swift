//
//  Competency.swift
//  TCC
//
//  Created by Felipe Ribeiro on 24/10/25.
//

import Foundation

struct Competency: Identifiable {
    let id = UUID()
    let page: Int
    let title: String
    let description: String
    
    let zeroDescription: String
    let fortyDescription: String
    let eightyDescription: String
    let oneTwentyDescription: String
    let oneSixtyDescription: String
    let twoHundredDescription: String
    
    var levels: [(Int, String)] {
        [
            (200, twoHundredDescription),
            (160, oneSixtyDescription),
            (120, oneTwentyDescription),
            (80, eightyDescription),
            (40, fortyDescription),
            (0, zeroDescription)
        ]
    }

    var url: URL? {
        GuideContent.url(forPage: page)
    }
    
    static let competencies: [Competency] = [
        .init(
            page: 14,
            title: "Competência I",
            description: "Demonstrar domínio da modalidade escrita formal da língua portuguesa",
            zeroDescription: "Demonstra desconhecimento da modalidade escrita formal da língua portuguesa.",
            fortyDescription: "Demonstra domínio precário da modalidade escrita formal da língua portuguesa, de forma sistemática, com diversificados e frequentes desvios gramaticais, de escolha de registro e de convenções da escrita.",
            eightyDescription: "Demonstra domínio insuficiente da modalidade escrita formal da língua portuguesa, com muitos desvios gramaticais, de escolha de registro e de convenções da escrita.",
            oneTwentyDescription: "Demonstra domínio mediano da modalidade escrita formal da língua portuguesa e de escolha de registro, com alguns desvios gramaticais e de convenções da escrita.",
            oneSixtyDescription: "Demonstra bom domínio da modalidade escrita formal da língua portuguesa e de escolha de registro, com poucos desvios gramaticais e de convenções da escrita.",
            twoHundredDescription: "Demonstra excelente domínio da modalidade escrita formal da língua portuguesa e de escolha de registro. Desvios gramaticais ou de convenções da escrita serão aceitos somente como excepcionalidade e quando não caracterizarem reincidência."
        ),
        .init(
            page: 16,
            title: "Competência II",
            description: "Compreender a proposta de redação e aplicar conceitos das várias áreas de conhecimento para desenvolver o tema dentro dos limites estruturais do texto dissertativo-argumentativo em prosa",
            zeroDescription: "Fuga ao tema/não atendimento à estrutura dissertativo-argumentativa. Nestes casos a redação recebe nota 0 (zero) e é anulada.",
            fortyDescription: "Apresenta o assunto, tangenciando o tema, ou demonstra domínio precário do texto dissertativo-argumentativo, com traços constantes de outros tipos textuais.",
            eightyDescription: "Desenvolve o tema recorrendo à cópia de trechos dos textos motivadores ou apresenta domínio insuficiente do texto dissertativo-argumentativo, não atendendo à estrutura com proposição, argumentação e conclusão.",
            oneTwentyDescription: "Desenvolve o tema por meio de argumentação previsível e apresenta domínio mediano do texto dissertativo-argumentativo, com proposição, argumentação e conclusão.",
            oneSixtyDescription: "Desenvolve o tema por meio de argumentação consistente e apresenta bom domínio do texto dissertativo-argumentativo, com proposição, argumentação e conclusão.",
            twoHundredDescription: "Desenvolve o tema por meio de argumentação consistente, a partir de um repertório sociocultural produtivo, e apresenta excelente domínio do texto dissertativo-argumentativo."
        ),
        .init(
            page: 29,
            title: "Competência III",
            description: "Selecionar, relacionar, organizar e interpretar informações, fatos, opiniões e argumentos em defesa de um ponto de vista.",
            zeroDescription: "Apresenta informações, fatos e opiniões não relacionados ao tema e sem defesa de um ponto de vista.",
            fortyDescription: "Apresenta informações, fatos e opiniões pouco relacionados ao tema ou incoerentes e sem defesa de um ponto de vista.",
            eightyDescription: "Apresenta informações, fatos e opiniões relacionados ao tema, mas desorganizados ou contraditórios e limitados aos argumentos dos textos motivadores, em defesa de um ponto de vista.",
            oneTwentyDescription: "Apresenta informações, fatos e opiniões relacionados ao tema, limitados aos argumentos dos textos motivadores e pouco organizados, em defesa de um ponto de vista.",
            oneSixtyDescription: "Apresenta informações, fatos e opiniões relacionados ao tema, de forma organizada, com indícios de autoria, em defesa de um ponto de vista.",
            twoHundredDescription: "Apresenta informações, fatos e opiniões relacionados ao tema proposto, de forma consistente e organizada, configurando autoria, em defesa de um ponto de vista."
        ),
        .init(
            page: 32,
            title: "Competência IV",
            description: "Demonstrar conhecimento dos mecanismos linguísticos necessários para a construção da argumentação",
            zeroDescription: "Não articula as informações.",
            fortyDescription: "Articula as partes do texto de forma precária.",
            eightyDescription: "Articula as partes do texto, de forma insuficiente, com muitas inadequações, e apresenta repertório limitado de recursos coesivos.",
            oneTwentyDescription: "Articula as partes do texto, de forma mediana, com inadequações, e apresenta repertório pouco diversificado de recursos coesivos.",
            oneSixtyDescription: "Articula as partes do texto, com poucas inadequações, e apresenta repertório diversificado de recursos coesivos.",
            twoHundredDescription: "Articula bem as partes do texto e apresenta repertório diversificado de recursos coesivos."
        ),
        .init(
            page: 35,
            title: "Competência V",
            description: "Elaborar proposta de intervenção para o problema abordado, respeitando os direitos humanos",
            zeroDescription: "Não apresenta proposta de intervenção ou apresenta proposta não relacionada ao tema ou ao assunto.",
            fortyDescription: "Apresenta proposta de intervenção vaga, precária ou relacionada apenas ao assunto.",
            eightyDescription: "Elabora, de forma insuficiente, proposta de intervenção relacionada ao tema, ou não articulada com a discussão desenvolvida no texto.",
            oneTwentyDescription: "Elabora, de forma mediana, proposta de intervenção relacionada ao tema e articulada à discussão desenvolvida no texto.",
            oneSixtyDescription: "Elabora bem proposta de intervenção relacionada ao tema e articulada à discussão desenvolvida no texto.",
            twoHundredDescription: "Elabora muito bem proposta de intervenção, detalhada, relacionada ao tema e articulada à discussão desenvolvida no texto."
        )
    ]
}
