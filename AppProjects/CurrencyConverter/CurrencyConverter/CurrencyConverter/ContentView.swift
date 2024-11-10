//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Daniel Cazorro Frías on 9/10/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.dismissKeyboard()
                }
            
            VStack {
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency conversion section
                HStack {
                    // Left conversion section
                    CurrencySectionView(
                        amount: $leftAmount,
                        currency: leftCurrency,
                        isLeftSection: true,
                        onCurrencyTap: {
                            showSelectCurrency.toggle()
                        }
                    )
                    .focused($leftTyping)
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    CurrencySectionView(
                        amount: $rightAmount,
                        currency: rightCurrency,
                        isLeftSection: false,
                        onCurrencyTap: {
                            showSelectCurrency.toggle()
                        }
                    )
                    .focused($rightTyping)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()

                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            saveCurrencySelection()
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            saveCurrencySelection()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency,
                           bottomCurrency: $rightCurrency)
        }
        .onAppear {
            loadCurrencySelection()
        }
    }
    
    // Guardar la selección en UserDefaults
    func saveCurrencySelection() {
        UserDefaults.standard.set(leftCurrency.rawValue, forKey: "leftCurrency")
        UserDefaults.standard.set(rightCurrency.rawValue, forKey: "rightCurrency")
    }
    
    // Cargar la selección desde UserDefaults
    func loadCurrencySelection() {
        let savedLeftCurrency = UserDefaults.standard.double(forKey: "leftCurrency")
        let savedRightCurrency = UserDefaults.standard.double(forKey: "rightCurrency")
        
        // Asigna las monedas solo si los valores guardados son válidos en Currency
        leftCurrency = Currency(rawValue: savedLeftCurrency) ?? .silverPiece
        rightCurrency = Currency(rawValue: savedRightCurrency) ?? .goldPiece
    }
}

#Preview {
    ContentView()
}
