//
//  NavigateIntent.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/11/25.
//

import AppIntents

struct NavigateIntent: TargetContentProvidingIntent {
    static let title: LocalizedStringResource = "Navegar para Seção"
    static let description: IntentDescription = "Navega para uma seção dentro do aplicativo."
    
    static let supportedModes: IntentModes = .foreground
    
    @Parameter(
        title: "Seção",
        requestValueDialog: "Qual seção?"
    )
    var navigationOption: NavigationOption
    
    static var parameterSummary: some ParameterSummary {
        Summary("Navegar para \(\.$navigationOption)")
    }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
