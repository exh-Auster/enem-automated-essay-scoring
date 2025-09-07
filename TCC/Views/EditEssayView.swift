//
//  EditEssayView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI
import SwiftData

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

struct EditEssayView: View {
    @Bindable var iteration: EssayIteration
    @Environment(\.modelContext) var modelContext
    
    @State private var expandedStates: [Bool]
    
    @Binding var path: NavigationPath
    
    init(iteration: EssayIteration, path: Binding<NavigationPath>) {
        self.iteration = iteration
        self.expandedStates = Array(repeating: true, count: iteration.paragraphCount)
        self._path = path
    }
    
    var body: some View {
        Group {
            if iteration.paragraphs.isEmpty {
                ContentUnavailableView {
                    Label("Adicione seu primeiro parágrafo", systemImage: "text.page")
                } description: {
                    Text("A estrutura sugerida para a redação do ENEM é de quatro parágrafos: um de introdução, dois de desenvolvimento e um de conclusão.")
                } actions: {
                    // TODO: extract & fix logic
                    Button("Adicionar um parágrafo") { addParagraph(at: 0) }
                        .buttonStyle(.bordered)
                    Button("Adicionar quatro parágrafos") { for _ in 1...4 { addParagraph(at: 0) } }
                        .buttonStyle(.borderedProminent)
//                    Button("Adicionar cinco parágrafos") { for _ in 1...5 { addParagraph(at: 0) } }
//                        .buttonStyle(.bordered)
                }
            } else {
                Form {
                    //            Button("Adicionar parágrafo", systemImage: "plus") {
                    //                addParagraph(at: 0)
                    //            }
                    
                    ForEach($iteration.paragraphs.indices, id: \.self) { i in
                        Section(isExpanded: $expandedStates[i]) {
                            TextEditor(text: $iteration.paragraphs[i])
                                .frame(minHeight: 300) // TODO: make dynamic
                                .contextMenu {
                                    Button("Apagar parágrafo", systemImage: "trash", role: .destructive) {
                                        removeParagraphs(at: IndexSet(integer: i))
                                    }
                                }
                            
                            Button("Adicionar parágrafo", systemImage: "plus") {
                                addParagraph(at: i + 1)
                            }
                        } header: {
                            SectionHeader(
                                title: "Parágrafo \(i + 1) (\(iteration.paragraphs[i].components(separatedBy: " ").count) palavras)",
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
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                NavigationLink {
                    IterationReviewView(iteration: iteration, path: $path)
                } label: {
                    Label("Submit", systemImage: "arrow.right")
                }
                // TODO: revisit approach
                .disabled(iteration.paragraphs.isEmpty)
            }
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
}

#Preview {
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
