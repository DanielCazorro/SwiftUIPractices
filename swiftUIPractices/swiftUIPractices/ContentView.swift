//
//  ContentView.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Write SwiftUI book")
            Text("Read Bible")
            Text("Bring kids out to play")
            Text("Fetch wife")
            Text("Call mum")
        }
        Button("Try") {
            print("Push")
        }
        VStack {
            Image(systemName: "trash")
                .imageScale(.large)
                .foregroundStyle(.secondary)
            Text("Hello, SwiftUI!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
