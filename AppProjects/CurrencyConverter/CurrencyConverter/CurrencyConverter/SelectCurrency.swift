//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Daniel Cazorro Frías on 22/10/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:\(Currency.copperPenny.rawValue)")
                    .fontWeight(.bold)
                
                // Currency icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                    }
                }
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Currency icons
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
