//
//  Extensions.swift
//  CurrencyConverter
//
//  Created by Daniel Cazorro Frías on 10/11/24.
//

import UIKit

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
