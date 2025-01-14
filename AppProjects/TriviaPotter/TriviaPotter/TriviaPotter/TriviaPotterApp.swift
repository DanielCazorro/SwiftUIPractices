//
//  TriviaPotterApp.swift
//  TriviaPotter
//
//  Created by Daniel Cazorro Frías on 7/1/25.
//

import SwiftUI

@main
struct TriviaPotterApp: App {
    @StateObject private var store = Store()
    @StateObject private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(game)
                .task {
                    await store.loadProducts()
                    game.loadScores()
                    store.loadStatus()
                }
        }
    }
}
