//
//  ContentView.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, SwiftUI!")
        Circle()
        Rectangle()
        Button("Press me") {
            print("Button tapped")
        }
    }
}

#Preview {
    ContentView()
}
