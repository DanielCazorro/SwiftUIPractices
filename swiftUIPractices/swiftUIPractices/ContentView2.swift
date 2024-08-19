//
//  ContentView2.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        HStack {
            Image(systemName: "trash")
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
}

#Preview {
    ContentView2()
}
