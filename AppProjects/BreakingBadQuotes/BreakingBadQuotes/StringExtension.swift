//
//  StringExtension.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 16/12/24.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
