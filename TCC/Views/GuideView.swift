//
//  GuideView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 21/10/25.
//

import SwiftUI
import WebKit

struct GuideView: View {
    var body: some View {
        NavigationStack {
            List {
//                Text("A Cartilha do Participante é um documento extensivo divulgado anualmente, contendo regras e orientações para a prova de redação do Enem.")
                
                NavigationLink {
                    WebView(url: GuideContent.url(forPage: GuideContent.essayExamplesPage))
                } label: {
                    CompetencyRow(title: "Amostra de Redações Nota 1000", description: "10 redações que receberam nota máxima no Enem 2024.")
                }
                
                Section {
                    ForEach(GuideContent.competencies) { competency in
                        NavigationLink {
                            WebView(url: competency.url)
                        } label: {
                            CompetencyRow(title: competency.title, description: competency.description)
                        }
                    }
                } header: {
                    VStack(alignment: .leading) {
                        Text("Competências")
                            .foregroundStyle(.black)
                        Text("A avaliação da redação do Enem é dividida em cinco competências individuais.")
                            .fontWeight(.regular)
                    }
                }
            }
            .listRowSpacing(16)
            .navigationTitle("Guia")
        }
    }
}

struct CompetencyRow: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .fontWidth(.condensed)
            
            Text(description)
                .font(.caption)
        }
    }
}

#Preview {
    NavigationStack {
        GuideView()
    }
}
