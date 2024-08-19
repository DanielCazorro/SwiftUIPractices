//
//  ContentView3.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.green)
                Button("Press me") {
                    print("Button tapped")
                }
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Begining SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                Text("Daniel, 2024")
            }
        }
    }
}

#Preview {
    ContentView3()
}
