//
//  EditEssayView.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import SwiftUI

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
    @Binding var iteration: EssayIteration
    @State private var expandedStates: [Bool]
    
    init(iteration: Binding<EssayIteration>, expandedStates: [Bool] = []) {
        self._iteration = iteration
        self._expandedStates = State(initialValue: Array(repeating: true, count: iteration.wrappedValue.paragraphCount))
    }
    
    var body: some View {
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
        .listRowSpacing(10)
        .scrollDismissesKeyboard(.interactively)
        //        .listSectionSeparator(.visible, edges: .all)
        .navigationTitle(iteration.essay?.topic?.title ?? "")
        .navigationSubtitle("Palavras: \(iteration.wordCount) | Parágrafos: \(iteration.paragraphCount)")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Submit", systemImage: "arrow.right") { } // TODO: implement
            }
            
            ToolbarItem {
                Menu("More", systemImage: "ellipsis") {
                    NavigationLink { // TODO: extract
                        ScrollView {
                            Text(iteration.fullText)
                                .fontDesign(.serif)
                                .padding()
                        }
                    } label: {
                        Label("Texto completo", systemImage: "text.document")
                    }
                }
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
    NavigationStack {
        Text("")
            .navigationDestination(isPresented: .constant(true)) {
                EditEssayView(iteration: .constant(EssayIteration.sampleData.first!))
            }
    }
}
