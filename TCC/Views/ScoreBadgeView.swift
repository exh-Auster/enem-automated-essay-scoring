
//  ScoreBadge.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI

enum ScoreBadgeType {
    case pending
    case individual
    case totalSmall
    case totalLarge
    
    var width: Double {
        switch self {
        case .totalLarge:
            return 180
        case .individual:
            return 65
        case .pending, .totalSmall:
            return 40
        }
    }
    
    var font: Font? {
        switch self {
        case .pending:
            return nil
        case .individual:
            return .title3
        case .totalSmall:
            return .footnote
        case .totalLarge:
            return .largeTitle
        }
    }
}

struct ScoreBadgeView: View {
    var label: String?
    var type: ScoreBadgeType = .individual
    let score: Int
    
    @State private var animateGradient = false
    @Environment(\.colorScheme) private var colorScheme
    
    // TODO: define the colors
    var badgeColor: Color {
        switch (type == .individual ? score : score / 5) {
        case 200:
            return .green
        case 160..<200:
            return .blue
        case 120..<160:
            return .mint
        case 80..<120:
            return .yellow
        case 40..<80:
            return .orange
        case 0..<40:
            return .red
        default:
            return .gray
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
//                .frame(width: label != nil ? 65 : 40)
                .frame(width: type.width)
                .foregroundStyle(badgeColor)
            
            if type != .pending {
                VStack {
                    if let label {
                        Text(label)
//                            .fontWeight(.thin)
                            .fontWeight(.light)
                    }
                    
                    Text("\(score)")
//                        .font((label != nil) ? .title3 : .footnote)
                        .font(type.font)
                        .bold()
                }
                .foregroundStyle(.white)
            } else {
                // TODO: improve and extract
                if colorScheme == .dark {
                    Circle()
//                        .frame(width: label != nil ? 65 : 40)
                        .frame(width: type.width)
                        .overlay(
                            Circle()
                                .fill(
                                    AngularGradient(
                                        gradient: Gradient(colors: [.blue, .purple, .blue]),
                                        center: .center,
                                        angle: .degrees(animateGradient ? 360 : 0)
                                    )
                                )
                                .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: animateGradient)
                        )
                        .blur(radius: 4)
                        .onAppear {
                            animateGradient = true
                        }
                } else {
                    Circle()
                        .fill(
                            AngularGradient(
                                gradient: Gradient(colors: colorScheme == .dark ? [.blue, .purple, .blue] : [.red, .yellow, .red]),
                                center: .center,
                                angle: .degrees(animateGradient ? 360 : 0)
                            )
                        )
                        .frame(width: 40)
                        .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: animateGradient)
                        .blur(radius: 5)
                        .onAppear {
                            animateGradient = true
                        }
                }
                
            }
        }
    }
}

#Preview("Light Mode") {
    VStack {
        ScoreBadgeView(type: .totalLarge, score: 1000)
        
        HStack {
            ScoreBadgeView(label: "C1", score: 200)
            ScoreBadgeView(label: "C2", score: 160)
            ScoreBadgeView(label: "C3", score: 120)
            ScoreBadgeView(label: "C4", score: 80)
            ScoreBadgeView(label: "C5", score: 40)
        }
        
        ScoreBadgeView(label: "C5", score: 0)
        
        HStack {
            ScoreBadgeView(type: .totalSmall, score: 200)
            
            ScoreBadgeView(type: .pending, score: 0)
        }
    }
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    VStack {
        ScoreBadgeView(type: .totalLarge, score: 1000)
        
        HStack {
            ScoreBadgeView(label: "C1", score: 200)
            ScoreBadgeView(label: "C2", score: 160)
            ScoreBadgeView(label: "C3", score: 120)
            ScoreBadgeView(label: "C4", score: 80)
            ScoreBadgeView(label: "C5", score: 40)
        }
        
        ScoreBadgeView(label: "C5", score: 0)
        
        HStack {
            ScoreBadgeView(type: .totalSmall, score: 200)
            
            ScoreBadgeView(type: .pending, score: 0)
        }
    }
    .preferredColorScheme(.dark)
}
