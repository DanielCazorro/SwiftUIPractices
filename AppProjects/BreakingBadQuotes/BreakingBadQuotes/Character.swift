//
//  Character.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 4/12/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    var death: Death?
}
