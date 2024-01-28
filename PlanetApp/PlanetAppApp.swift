//
//  PlanetAppApp.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

@main
struct PlanetAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
