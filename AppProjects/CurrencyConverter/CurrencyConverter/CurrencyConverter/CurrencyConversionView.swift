//
//  CurrencyConversionView.swift
//  CurrencyConverter
//
//  Created by Daniel Cazorro Frías on 10/11/24.
//

import SwiftUI

struct CurrencySectionView: View {
    @Binding var amount: String
    let currency: Currency
    let isLeftSection: Bool
    let onCurrencyTap: () -> Void
    @FocusState var isTyping: Bool
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                if isLeftSection {
                    Image(currency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                }
                
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                if !isLeftSection {
                    Image(currency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                onCurrencyTap()
            }
            
            // Text Field
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($isTyping)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(isLeftSection ? .leading : .trailing)
        }
    }
}

#Preview {
    CurrencySectionView(amount: .constant("123.45"),
                        currency: .copperPenny,
                        isLeftSection: true,
                        onCurrencyTap: {})
}
