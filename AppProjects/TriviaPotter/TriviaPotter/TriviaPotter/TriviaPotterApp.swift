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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .task {
                    await store.loadProducts()
                }
        }
    }
}
