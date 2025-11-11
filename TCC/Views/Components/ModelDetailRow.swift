//
//  ModelDetailRow.swift
//  TCC
//
//  Created by Felipe Ribeiro on 19/09/25.
//

import SwiftUI

struct ModelDetailRow: View {
    let name: String
    let value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    init(name: String, value: Double) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .percent
//        formatter.minimumFractionDigits = 1
//        formatter.maximumFractionDigits = 1
        
        self.name = name
//        self.value = formatter.string(from: NSNumber(value: value))!
        self.value = value.description
    }
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}
