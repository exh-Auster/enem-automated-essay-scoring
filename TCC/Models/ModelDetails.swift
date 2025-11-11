//
//  ModelDetails.swift
//  TCC
//
//  Created by Felipe Ribeiro on 19/09/25.
//

struct ModelDetails: Identifiable, Codable {
    let id: Int
    let name: String
    let version: String
    let f1: Double
    let qwk: Double
}
