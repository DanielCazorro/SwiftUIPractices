//
//  ContentView.swift
//  swiftUIPractices
//
//  Created by Daniel Cazorro Frías on 19/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.yellow)
                Button("Increment") {
                    self.count += 1
                }
            }
            .frame(width: 100, height: 100)
            
            ZStack {
                Circle()
                    .fill(Color.gray)
                Button("Reset") {
                    self.count = 0
                }
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Count: \(count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
                Text("Daniel, 2024")

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
