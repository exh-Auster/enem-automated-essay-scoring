//
//  OnboardingView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 10/10/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("needsOnboarding") var needsOnboarding = true
    
    @State private var currentCardIndex = 0
    
    let cardContents: [(systemImage: String, title: String, content: String)] = [
        (
            "checkmark.circle",
            "Escolha um tema",
            "Você pode praticar com diversos temas das últimas edições da prova do Enem."
        ),
        (
            "pencil",
            "Escreva sua redação",
            "Escolha entre escrever diretamente dentro do aplicativo, colar de outra fonte ou importar um arquivo de texto."
        ),
        (
            "sparkles",
            "Revise e submeta",
            "A avaliação é realizada por meio de IA local: suas redaçoes nunca saem do seu dispositivo."
        ),
        (
            "arrow.trianglehead.2.counterclockwise.rotate.90",
            "Continue a praticar",
            "Itere a partir de tentativas anteriores, ou comece uma nova redação a partir de qualquer tema disponível."
        ),
    ]
    
    var body: some View {
        Group {
            Text("Boas-vindas ao AES!")
                .font(.largeTitle)
                .fontDesign(.serif)
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            
            ScrollView {
                ForEach(cardContents.enumerated(), id: \.offset) { offset, element in
                    if currentCardIndex >= offset {
                        OnboardingRow(systemImage: element.systemImage, title: element.title, content: element.content)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            
            Spacer()
            
            bottomButton
        }
        .padding(.horizontal)
        .sensoryFeedback(.increase, trigger: currentCardIndex)
        .sensoryFeedback(.success, trigger: needsOnboarding) { !$1 }
    }
    
    // MARK: - ViewBuilders
    
    @ViewBuilder
    private var bottomButton: some View {
        let isLastCard = currentCardIndex >= cardContents.count - 1
        
        Button {
            withAnimation {
                if isLastCard {
                    needsOnboarding = false
                }
            }
        } label: {
            Text("Começar")
                .padding(.vertical, 10)
        }
        .buttonStyle(.glassProminent)
        .buttonSizing(.flexible)
    }
}

// MARK: - Subviews

struct OnboardingRow: View {
    let systemImage: String
    let title: String
    let content: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                
                Text(content)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        Text("OnboardingView preview")
    }
    .fullScreenCover(isPresented: .constant(true)) {
        OnboardingView()
    }
}
