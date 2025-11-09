//
//  IterationRow.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI

struct IterationRow: View {
    let iteration: EssayIteration
    
    var creationDate: String {
        iteration.creationDate.formatted(date: .numeric, time: .omitted)
    }
    
    var submissionDate: String? {
        iteration.submissionDate?.formatted(date: .numeric, time: .omitted)
    }
    
    var body: some View {
        HStack {
            // TODO: creation date vs. submission date
            VStack(alignment: .leading) {
                Text(creationDate + ((submissionDate != nil) ? " ~ \(submissionDate ?? "")" : ""))
                    .textScale(.secondary)
                    .textCase(.uppercase)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                
                Text("Iteração \(iteration.numericID + 1)")
            }
            
            Spacer()
            
            ScoreBadgeView(type: iteration.isCompleted ? .totalSmall : .pending, score: iteration.totalScore ?? -1)
        }
    }
}

#Preview {
    let iteration = EssayIteration(
        essay: Essay(topic: Topic.topics.first!),
        date: .now,
        paragraphs: ["IterationRow test"],
    )
    
    NavigationStack {
        List {
            ForEach(1..<10) { _ in
                NavigationLink {
                    IterationRow(iteration: iteration)
                } label: {
                    IterationRow(iteration: iteration)
                }
            }
        }
        .navigationTitle("Iterations")
        .navigationSubtitle(Topic.topics.first!.title)
    }
}
