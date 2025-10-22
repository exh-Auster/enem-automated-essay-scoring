//
//  EditEssayView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import NaturalLanguage
import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct EditEssayView: View {
    @AppStorage("debugEnabled") var debugEnabled = false
    
    @Bindable var iteration: EssayIteration
    @Environment(\.modelContext) var modelContext
    
    @State private var expandedStates: [Bool]
    
    @State private var isShowingMinLengthAlert = false
    @State private var isShowingIncorrectLanguageAlert = false
    
    @State private var isShowingReviewScreen = false
  
    @State private var importedText: String = ""
    @State private var isShowingFileImporter = false
    @State private var isShowingImportConfirmationSheet = false
    
    @Binding var path: NavigationPath
    
    init(iteration: EssayIteration, path: Binding<NavigationPath>) {
        self.iteration = iteration
        
        // TODO: fix fixed initial count value
        self.expandedStates = Array(repeating: true, count: 1000)
        self._path = path
    }
    
    var body: some View {
        Group {
            if iteration.paragraphs.isEmpty {
                ContentUnavailableView {
                    Label("Adicione seu primeiro parágrafo", systemImage: "text.page")
                } description: {
                    Text("A estrutura sugerida para a redação do ENEM é de quatro parágrafos: um de introdução, dois de desenvolvimento e um de conclusão. Você pode adicionar ou remover parágrafos a qualquer momento.")
                } actions: {
                    // TODO: extract & fix logic
                    Button("Adicionar um parágrafo", systemImage: "1.circle") { addParagraph(at: 0) }
                        .buttonStyle(.glass)
                    
                    Button("Adicionar quatro parágrafos", systemImage: "4.circle") { for _ in 1...4 { addParagraph(at: 0) } }
                        .buttonStyle(.glassProminent)
                    
                    Menu("Importar...", systemImage: "plus") {
                        Button {
                            isShowingFileImporter = true
                        } label: {
                            Label("Importar de Arquivos", systemImage: "folder")
                        }
                        
                        PasteButton(payloadType: String.self) { fullText in
                            importedText = fullText[0]
                            isShowingImportConfirmationSheet = true
                        }
                    }
                    .buttonStyle(.glass)
                }
//                .buttonSizing(.flexible)
            } else {
                Form {
                    //            Button("Adicionar parágrafo", systemImage: "plus") {
                    //                addParagraph(at: 0)
                    //            }
                    
                    ForEach($iteration.paragraphs.enumerated(), id: \.offset) { i, $paragraph in
                        Section(isExpanded: $expandedStates[i]) {
                            TextField("", text: $paragraph, axis: .vertical)
                                .lineLimit(7...)
                                .contextMenu {
                                    Button("Apagar parágrafo", systemImage: "trash", role: .destructive) {
                                        removeParagraphs(at: IndexSet(integer: i))
                                    }
                                }
                            
                            Button("Adicionar parágrafo", systemImage: "plus") {
                                addParagraph(at: i + 1)
                            }
                        } header: {
                            SectionHeader(title: "Parágrafo \(i + 1) (\(iteration.getWordCountForParagraph(at: i) ?? 0) palavras)",
                                isExpanded: $expandedStates[i]
                            )
                        }
                    }
                    .onDelete(perform: removeParagraphs)
                }
            }
        }
        .listRowSpacing(10)
        .scrollDismissesKeyboard(.interactively)
        //        .listSectionSeparator(.visible, edges: .all)
        .navigationTitle(iteration.essay?.topic?.title ?? "")
        .navigationSubtitle("Palavras: \(iteration.wordCount) | Parágrafos: \(iteration.paragraphCount)")
        .toolbarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isShowingReviewScreen) {
            IterationReviewView(iteration: iteration, path: $path)
        }
        .toolbar {
            if debugEnabled {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        IterationDebugView(iteration: iteration)
                    } label: {
                        Label("Debug", systemImage: "ant")
                    }
                    // TODO: conditionally disable
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    if !validateLength() {
                        isShowingMinLengthAlert = true
                    } else if !validateLanguage() {
                        isShowingIncorrectLanguageAlert = true
                    } else {
                        isShowingReviewScreen = true
                    }
                } label: {
                    Label("Revisar", systemImage: "arrow.right")
                }
                // TODO: revisit approach
                .disabled(iteration.paragraphs.isEmpty)
            }
        }
        .alert("Texto Muito Curto", isPresented: $isShowingMinLengthAlert) {
            
        } message: { // TODO: confirm and extract
            Text("Os parágrafos da redação devem ter, no mínimo, 50 palavras cada. Verifique o texto e tente novamente.")
        }
        .alert("Idioma Não Reconhecido", isPresented: $isShowingIncorrectLanguageAlert) {
            
        } message: {
            Text("A redação deve ser escrita em Português. Verifique o texto e tente novamente.")
        }
        .sensoryFeedback(.error, trigger: isShowingMinLengthAlert) { $1 }
        .sensoryFeedback(.error, trigger: isShowingIncorrectLanguageAlert) { $1 }
        .fileImporter(isPresented: $isShowingFileImporter, allowedContentTypes: [.plainText]) { result in
            switch result {
            case .success(let fileUrl):
                do {
                    try importedText = decodeTextFile(from: fileUrl)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        .sheet(isPresented: $isShowingImportConfirmationSheet) {
            applyImportedText()
        } content: {
            ImportConfirmationView(iteration: iteration, importedText: $importedText)
        }
    }
    
    private func addParagraph(at index: Int) {
        withAnimation {
            iteration.paragraphs.insert("", at: index)
            expandedStates.insert(true, at: index)
        }
    }
    
    private func removeParagraphs(at indexSet: IndexSet) {
        withAnimation {
            iteration.paragraphs.remove(atOffsets: indexSet)
            expandedStates.remove(atOffsets: indexSet)
        }
    }
    
    private func validateLength() -> Bool {
        let minWordCount = 50 // TODO: confirm and extract
        let wordCounts = iteration.paragraphs.map { $0.components(separatedBy: " ").count }
        
        guard wordCounts.allSatisfy({ $0 >= minWordCount }) else { return false }
        
        return true
    }
    
    private func validateLanguage() -> Bool {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(iteration.fullText)
        
        guard let dominantLanguage = recognizer.dominantLanguage, dominantLanguage == .portuguese else { return false }
        
        return true
    }
    
    private func decodeTextFile(from fileURL: URL) throws -> String {
        let didStartAccessing = fileURL.startAccessingSecurityScopedResource()
        
        defer {
            if didStartAccessing {
                fileURL.stopAccessingSecurityScopedResource()
            }
        }
        
        return try String(contentsOf: fileURL, encoding: .utf8)
    }
    
    private func applyImportedText() {
        guard !importedText.isEmpty else { return }
        
        withAnimation {
            iteration.fullText = importedText
        }
            
        importedText = ""
    }
}

// MARK: - Subviews

struct ExpandButton: View {
    @Binding var isExpanded: Bool

    var body: some View {
        Button(
            isExpanded ? "Collapse" : "Expand",
            systemImage: "chevron.down"
        ) {
            withAnimation {
                isExpanded.toggle()
            }
        }
        .labelStyle(.iconOnly)
        .rotationEffect(isExpanded ? Angle(degrees: 0) : Angle(degrees: -90))
//        .frame(width: 20, height: 20)
    }
}

struct SectionHeader: View {
    let title: String
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack {
            Text(title)
            
            Spacer()
            
            ExpandButton(isExpanded: $isExpanded)
        }
    }
}

// MARK: - Previews

#Preview("Populated") {
    @Previewable @State var isPresented = true
    @Previewable @State var path = NavigationPath()
    
    let iteration = SampleData.shared.iteration
    
    NavigationStack {
        Button(isPresented.description) { isPresented.toggle() }
            .navigationDestination(isPresented: $isPresented) {
                EditEssayView(iteration: iteration, path: $path)
            }
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty") {
    @Previewable @State var isPresented = true
    @Previewable @State var path = NavigationPath()
    
    let iteration = EssayIteration(
        essay: Essay(topic: Topic.topics.first!),
        date: .now,
        paragraphs: []
    )
    
    NavigationStack {
        Button(isPresented.description) { isPresented.toggle() }
            .navigationDestination(isPresented: $isPresented) {
                EditEssayView(iteration: iteration, path: $path)
            }
    }
    .modelContainer(SampleData.shared.modelContainer)
}

