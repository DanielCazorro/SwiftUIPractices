//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Daniel Cazorro Frías on 18/12/24.
//

import SwiftUI

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
