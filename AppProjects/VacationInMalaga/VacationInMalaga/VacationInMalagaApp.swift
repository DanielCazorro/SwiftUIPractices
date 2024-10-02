//
//  VacationInMalagaApp.swift
//  VacationInMalaga
//
//  Created by Daniel Cazorro Frías on 1/10/24.
//

import SwiftUI

@main
struct VacationInMalagaApp: App {
    var body: some Scene {
        WindowGroup {
            Symbols()
        }
        .modelContainer(for: Place.self)
    }
}
