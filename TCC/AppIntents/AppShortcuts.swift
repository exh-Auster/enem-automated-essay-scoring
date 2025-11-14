//
//  AppShortcuts.swift
//  TCC
//
//  Created by Felipe Ribeiro on 13/11/25.
//

import AppIntents

struct AppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: NavigateIntent(),
            phrases: [
//                "Navegar em \(.applicationName)",
                "Navegar para \(\.$navigationOption) em \(.applicationName)"
            ],
            shortTitle: "Navegar",
            systemImageName: "arrowshape.forward"
        )
    }
}
