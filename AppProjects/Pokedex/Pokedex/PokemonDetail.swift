//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Daniel Cazorro Frías on 30/12/24.
//

import SwiftUI
import CoreData

struct PokemonDetail: View {
    @EnvironmentObject var pokemon: Pokemon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonDetail()
        .environmentObject(SamplePokemon.samplePokemon ?? Pokemon())
}
