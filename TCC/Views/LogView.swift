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
                    ToolbarItem {
                        Button {
                            let generator = UINotificationFeedbackGenerator()
                            
                            UIPasteboard.general.string = logStore.exportEntries()
                            generator.notificationOccurred(.success)
                        } label: {
                            Label("Copiar", systemImage: "document.on.document")
                        }
                    }
                    
                    ToolbarItem(placement: .primaryAction) {
                        Button("Atualizar", systemImage: "arrow.clockwise") {
                            Task {
                                let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()

                                impactFeedbackGenerator.impactOccurred()
                                await logStore.fetchEntries()
                                notificationFeedbackGenerator.notificationOccurred(.success)
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
