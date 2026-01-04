//
//  SettingsView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 17/09/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("debugEnabled") var debugEnabled = false
    @AppStorage("needsOnboarding") var needsOnboarding = true
    
    @Environment(\.dismiss) var dismiss
    
    @State private var debugToggleVisible = false
    
    var body: some View {
        List {
            Section {
                NavigationLink {
                    ModelsDetailView()
                } label: {
                    Label("Informações", systemImage: "info.circle")
                }
            } footer: {
                Text("Detalhes e métricas dos modelos de Avaliação Automática de Redação.")
            }
            
            Section {
                Button("Refazer Introdução", systemImage: "arrow.counterclockwise") {
                    needsOnboarding = true
                }
            }
            
            if debugToggleVisible || debugEnabled {
                Section {
                    Toggle(isOn: $debugEnabled.animation()) {
                        Label("Habilitar Debug", systemImage: "ant")
                    }
                } footer: {
                    Text("Habilita telas de debug e exibe estatísticas adicionais, como número de tokens.")
                }
                
                Section {
                    NavigationLink {
                        LogView()
                    } label: {
                        Label("Logs", systemImage: "doc.text.magnifyingglass")
                    }

                }
            }
        }
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Fechar", systemImage: "xmark") {
                    dismiss()
                }
            }
        }
        .onTapGesture(count: 5) {
            withAnimation {
                debugToggleVisible = true
            }
        }
        .sensoryFeedback(.selection, trigger: debugToggleVisible)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
