//
//  Competency.swift
//  TCC
//
//  Created by Felipe Ribeiro on 24/10/25.
//

import Foundation

struct Competency: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let page: Int

    var url: URL? {
        GuideContent.url(forPage: page)
    }
}
