//
//  ContentView.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Breaking Bad Quotes")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad",
                          systemImage: "tortoise")
                }
            Text("Better Call Saul Quotes")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Better Call Saul",
                          systemImage: "briefcase")
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
