//
//  ContentView.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
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
        .padding()
    }
}

#Preview {
    ContentView()
}
