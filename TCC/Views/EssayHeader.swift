//
//  EssayHeader.swift
//  TCC
//
//  Created by Felipe Ribeiro on 28/10/25.
//

import SwiftUI

struct EssayHeader: View {
    @State private var isShowingFullHeader = true
    
    let title: String
    var wordCount: Int? = nil
    var paragraphCount: Int? = nil
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            if isShowingFullHeader {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            
            if let paragraphCount, let wordCount, paragraphCount > 0 {
                HStack(spacing: 15) {
                    CountCard(title: "palavras", count: wordCount)
                    
                    CountCard(title: "parágrafos", count: paragraphCount)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            guard let paragraphCount, paragraphCount > 0 else { return }
            
            withAnimation {
                isShowingFullHeader.toggle()
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
        .padding(.top, 4)
        .background {
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0, style: .circular)
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
}

// MARK: - Subviews

struct CountCard: View {
    let title: String
    let count: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Text(count, format: .number)
                .font(.headline)
                .fontWeight(.bold)
            Text(title.lowercased())
        }
        .padding(.horizontal, 25)
    }
}
