//
//  NavigationOption.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/11/25.
//

import AppIntents

enum NavigationOption: String, AppEnum {
    case essays
    case guide
    
    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Opção de Navegação"
    
    static let caseDisplayRepresentations: [NavigationOption: DisplayRepresentation] = [
        .essays: DisplayRepresentation(
            title: "Redações",
            image: .init(systemName: "book.pages.fill")
        ),
        .guide: DisplayRepresentation(
            title: "Guia",
            image: .init(systemName: "text.book.closed.fill")
        )
    ]
}
