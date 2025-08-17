
//  ScoreBadge.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI

enum ScoreBadgeType {
    case pending
    case individual
    case total
}

struct ScoreBadgeView: View {
    var label: String?
    var type: ScoreBadgeType = .individual
    let score: Int
    
    @State private var animateGradient = false
    @Environment(\.colorScheme) private var colorScheme
    
    // TODO: define the colors
    var badgeColor: Color {
        switch (type == .individual ? score : score / 4) {
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
                .frame(width: label != nil ? 65 : 40)
                .foregroundStyle(badgeColor)
            
            if type != .pending {
                VStack {
                    if let label {
                        Text(label)
//                            .fontWeight(.thin)
                            .fontWeight(.light)
                    }
                    
                    Text("\(score)")
                        .font((label != nil) ? .title3 : .footnote)
                        .bold()
                }
                .foregroundStyle(.white)
            } else {
                // TODO: improve and extract
                if colorScheme == .dark {
                    Circle()
                        .frame(width: label != nil ? 65 : 40)
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
        HStack {
            ScoreBadgeView(label: "C1", score: 200)
            ScoreBadgeView(label: "C2", score: 160)
            ScoreBadgeView(label: "C3", score: 120)
            ScoreBadgeView(label: "C4", score: 80)
            ScoreBadgeView(label: "C5", score: 40)
        }
        
        ScoreBadgeView(label: "C5", score: 0)
        
        HStack {
            ScoreBadgeView(type: .total, score: 200)
            
            ScoreBadgeView(type: .pending, score: 0)
        }
    }
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    VStack {
        HStack {
            ScoreBadgeView(label: "C1", score: 200)
            ScoreBadgeView(label: "C2", score: 160)
            ScoreBadgeView(label: "C3", score: 120)
            ScoreBadgeView(label: "C4", score: 80)
            ScoreBadgeView(label: "C5", score: 40)
        }
        
        ScoreBadgeView(label: "C5", score: 0)
        
        HStack {
            ScoreBadgeView(type: .total, score: 200)
            
            ScoreBadgeView(type: .pending, score: 0)
        }
    }
    .preferredColorScheme(.dark)
}
