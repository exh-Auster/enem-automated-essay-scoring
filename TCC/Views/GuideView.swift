//
//  GuideView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 21/10/25.
//

import SwiftUI
import WebKit

struct GuideView: View {
    @State private var selectedPage: GuidePage?
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text(
                    """
                    A Cartilha do Participante é um documento extensivo divulgado anualmente, contendo regras e orientações para a prova de redação do Enem.
                    
                    Abaixo, você pode consultar 10 exemplos de redação nota 1000 e o manual de cada uma das cinco competências da prova.
                    """
                    )
                    .font(.subheadline)
                    .listRowBackground(Color.clear)
                    .listRowInsets(.top, 5)
                    .listRowInsets(.leading, 5)
                }
                .listSectionSpacing(0)
                
                Section("Amostras de Redações Nota 1000") {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(GuideContent.essayExamplePages.enumerated(), id: \.offset) { index, essayExamplePage in
                            Button {
                                selectedPage = GuidePage(number: essayExamplePage)
                            } label: {
                                Text("Redação \(index + 1)")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, minHeight: 35)
                            }
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.enemBlue2)
                        .buttonBorderShape(.roundedRectangle(radius: 12))
                    }
                }
                
                Section("Competências") {
                    ForEach(Competency.competencies) { competency in
                        NavigationLink {
                            WebView(url: competency.url)
                        } label: {
                            CompetencyRow(title: competency.title, description: competency.description)
                        }
                    }
                }
            }
            .listRowSpacing(16)
            .navigationTitle("Guia")
        }
        .sheet(item: $selectedPage) { page in
            GuidePDFView(pageNum: page.number)
        }
    }
}

struct GuidePage: Identifiable {
    let number: Int
    
    var id: Int { number }
}

struct GuidePDFView: View {
    let pageNum: Int
    
    @Environment(\.dismiss) var dismiss
    
    var pageURL: URL {
        GuideContent.url(forPage: pageNum)!
    }
    
    var body: some View {
        NavigationStack {
            WebView(url: pageURL)
                .toolbar {
                    Button(role: .close) { dismiss() }
                }
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
