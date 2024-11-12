//
//  ApexPredator.swift
//  ApexPredators
//
//  Created by Daniel Cazorro Frías on 12/11/24.
//

import Foundation

struct ApexPredator: Decodable {
    let id: Int
    let name, type: String
    let latitude, longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let links: String
    
    struct MovieScene: Decodable {
        let id: Int
        let movie, sceneDescription: String
    }
}
