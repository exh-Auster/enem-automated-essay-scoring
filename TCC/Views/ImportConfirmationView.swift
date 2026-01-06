//
//  ImportConfirmationView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 18/10/25.
//

import SwiftUI

struct ImportConfirmationView: View {
    @Bindable var iteration: EssayIteration
    @Binding var importedText: String
    
    @State private var revisedImportedText: String = ""
    
    @State private var isShowingFindNavigator = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Verifique se o texto abaixo foi importado corretamente, mantendo parágrafos separados por uma quebra de linha.")
                    Text("Caso necessário, faça ajustes antes de confirmar.")
                }
                .font(.headline)
                .padding(.top)
                
                Divider()
                    .padding(.vertical)
                
                TextEditor(text: $revisedImportedText)
                    .fontDesign(.serif)
                    .autocorrectionDisabled()
                    .findNavigator(isPresented: $isShowingFindNavigator)
            }
            .padding(.horizontal)
            .navigationTitle("Revisão")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        importedText = ""
                        dismiss()
                    }
                }
                
                ToolbarItem {
                    Button("Buscar", systemImage: "text.page.badge.magnifyingglass") {
                        isShowingFindNavigator = true
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Importar", systemImage: "checkmark") {
                        importedText = revisedImportedText
                        dismiss()
                    }
                    .disabled(revisedImportedText.isEmpty)
                }
            }
            .interactiveDismissDisabled()
            .onAppear { // TODO: confirm approach
                revisedImportedText = importedText
            }
        }
    }
}

// MARK: - Previews

#Preview("Populated (portrait)") {
    @Previewable @State var iteration = SampleData.shared.iteration
    @Previewable @State var importedText = SampleData.shared.iteration.fullText
    
    Text("")
        .sheet(isPresented: .constant(true)) {
            ImportConfirmationView(iteration: iteration, importedText: $importedText)
        }
}

#Preview("Populated (landscape)", traits: .landscapeLeft) {
    @Previewable @State var iteration = SampleData.shared.iteration
    @Previewable @State var importedText = SampleData.shared.iteration.fullText
    
    Text("")
        .sheet(isPresented: .constant(true)) {
            ImportConfirmationView(iteration: iteration, importedText: $importedText)
        }
}

#Preview("Empty (portrait)") {
    @Previewable @State var iteration = SampleData.shared.iteration
    @Previewable @State var importedText = ""
    
    Text("")
        .sheet(isPresented: .constant(true)) {
            ImportConfirmationView(iteration: iteration, importedText: $importedText)
        }
}

#Preview("Empty (landscape)", traits: .landscapeLeft) {
    @Previewable @State var iteration = SampleData.shared.iteration
    @Previewable @State var importedText = ""
    
    Text("")
        .sheet(isPresented: .constant(true)) {
            ImportConfirmationView(iteration: iteration, importedText: $importedText)
        }
}
