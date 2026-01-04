//
//  LogStore.swift
//  TCC
//
//  Created by Felipe Ribeiro on 03/01/26.
//

import Foundation
import OSLog

@Observable
class LogStore {
    private(set) var entries: [String] = []
    
    func fetchEntries() async {
        do {
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let predicate = NSPredicate(format: "subsystem == %@", Bundle.main.bundleIdentifier!)
            
            entries = try await Task.detached {
                try store.getEntries(with: .reverse, matching: predicate)
                    .compactMap { $0 as? OSLogEntryLog }
                    .map { "[\($0.date.ISO8601Format())] [\($0.category)] \($0.composedMessage)" }
            }.value
        } catch {
            print(error.localizedDescription)
        }
    }
}
