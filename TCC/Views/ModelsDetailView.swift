//
//  ModelsDetailView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 19/09/25.
//

import SwiftUI

struct ModelsDetailView: View {
    private let modelDetails: [ModelDetails]
    
    init() {
        if let url = Bundle.main.url(forResource: "model-info", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([ModelDetails].self, from: data) {
            modelDetails = decoded
        } else {
            modelDetails = []
        }
    }
    
    var body: some View {
        List {
            Text("""
                Os modelos de classificação implementados neste aplicativo foram desenvolvidos a partir do fine-tuning do BERTimbau. Abaixo, você pode consultar as métricas de desempenho de cada um dos modelos.
                """)
            .listRowBackground(Color.clear)
            .listRowInsets(.top, 5)
            .listRowInsets(.leading, 5)
            .listRowInsets(.bottom, 5)
            
            ForEach(modelDetails) { modelDetails in
                Section(modelDetails.name) {
                    ModelDetailRow(name: "Versão", value: modelDetails.version)
                    ModelDetailRow(name: "F1", value: modelDetails.f1)
                    ModelDetailRow(name: "QWK", value: modelDetails.qwk)
                }
            }
        }
        .navigationTitle("Informações")
    }
}

#Preview {
    NavigationStack {
        ModelsDetailView()
    }
}
