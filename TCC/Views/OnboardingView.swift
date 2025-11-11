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
            "list.bullet",
            "Escolha um tema",
            "Você pode praticar com diversos temas das últimas edições da prova do Enem."
        ),
        (
            "circle.dotted.and.circle",
            "Crie sua primeira iteração",
            "Cada iteração representa uma tentativa de desenvolver uma redação em um determinado tema."
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
            "Aprimore iterações anteriores, ou comece uma nova redação sobre qualquer tema disponível."
        ),
    ]
    
    var body: some View {
        Group {
            Text("Boas-vindas!")
                .font(.largeTitle)
                .fontDesign(.serif)
                .fontWeight(.medium)
                .bold()
                .padding()
                .padding(.top)
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
            
            if currentCardIndex >= cardContents.count {
                bottomButton
                    .padding(.bottom)
            }
        }
        .padding(.horizontal)
        .sensoryFeedback(.increase, trigger: currentCardIndex)
        .sensoryFeedback(.success, trigger: needsOnboarding) { !$1 }
        .task {
            let stepDelay: Duration = .seconds(0.4)
            let rowAnimationDuration: TimeInterval = 0.9
            
            for index in 1...cardContents.count {
                try? await Task.sleep(for: stepDelay)
                withAnimation(.smooth(duration: rowAnimationDuration)) {
                    currentCardIndex = index
                }
            }
        }
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
                .frame(width: 36, alignment: .center)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
//                    .fontDesign(.serif)
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
