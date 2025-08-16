//
//  SwiftUIView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI

struct TopicRowView: View {
    let topic: Topic
    
    var body: some View {
        VStack(alignment: .leading) {
            if let source = topic.source {
                Text(source)
                    .fontWeight(.semibold)
                    .fontWidth(.condensed)
            }
            
            Text(topic.title)
        }
    }
}

#Preview("Single row") {
    let topic = Topic.topics.first!
    
    List {
        TopicRowView(topic: topic)
    }
}

#Preview("Multiple rows") {
    List(Topic.topics) { topic in
        TopicRowView(topic: topic)
    }
}
