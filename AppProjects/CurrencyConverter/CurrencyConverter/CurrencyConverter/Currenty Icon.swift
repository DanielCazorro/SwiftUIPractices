//
//  Currenty Icon.swift
//  CurrencyConverter
//
//  Created by Daniel Cazorro Frías on 22/10/24.
//

import SwiftUI

struct Currenty_Icon: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        // Currency icons
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    Currenty_Icon(currencyImage: .goldpiece, currencyName: "Gold Piece")
}
