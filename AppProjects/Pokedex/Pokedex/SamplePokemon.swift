//
//  SamplePokemon.swift
//  Pokedex
//
//  Created by Daniel Cazorro Frías on 1/1/25.
//

import Foundation
import CoreData

struct SamplePokemon {
    static let samplePokemon: Pokemon = {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        do {
            if let pokemon = try context.fetch(fetchRequest).first {
                return pokemon
            }
        } catch {
            print("Failed to fetch sample Pokemon: \(error)")
        }
        
        // Si no se encuentra un Pokémon en la base de datos, se crea uno de muestra.
        let samplePokemon = Pokemon(context: context)
        samplePokemon.id = 1
        samplePokemon.name = "bulbasaur"
        samplePokemon.types = ["grass", "poison"]
        samplePokemon.hp = 45
        samplePokemon.attack = 49
        samplePokemon.defense = 49
        samplePokemon.specialAttack = 65
        samplePokemon.specialDefense = 65
        samplePokemon.speed = 45
        samplePokemon.sprite = URL(string: "https://raw.githubusercontent.com/PokeAPI/pokeapi-sprites/master/sprites/pokemon/1.png")
        samplePokemon.shiny = URL(string: "https://raw.githubusercontent.com/PokeAPI/pokeapi-sprites/master/sprites/pokemon/shiny/1.png")
        samplePokemon.favorite = false
        return samplePokemon
    }()
}
