//
//  Constants.swift
//  TriviaPotter
//
//  Created by Daniel Cazorro Frías on 7/1/25.
//

import Foundation
import SwiftUI

enum Constants {
    static let hpFont = "PartyLetPlain"
}

struct InfoBackgroundImage: View {
    var body: some View {
        Image("parchment")
            .resizable()
            .ignoresSafeArea()
            .background(.brown)
    }
}

extension Button {
    func doneButton() -> some View {
        self
            .font(.largeTitle)
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.brown)
            .foregroundStyle(.white)
    }
}
