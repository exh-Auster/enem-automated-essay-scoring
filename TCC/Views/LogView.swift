//
//  LogView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 03/01/26.
//

import OSLog
import SwiftUI

struct LogView: View {
    @Environment(LogStore.self) private var logStore
    @State private var isLoading = true
    
    var body: some View {
        Group {
            switch isLoading {
            case true:
                ProgressView()
            case false:
                Group {
                    if logStore.entries.isEmpty {
                        ContentUnavailableView("Sem logs disponíveis", systemImage: "tray")
                    } else {
                        List {
                            ForEach(logStore.entries, id: \.self) {
                                Text($0)
                                    .fontDesign(.monospaced)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Atualizar", systemImage: "arrow.clockwise") {
                            Task {
                                await logStore.fetchEntries()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Logs")
        .task {
            await logStore.fetchEntries()
            isLoading = false
        }
    }
}

#Preview {
    LogView()
}
