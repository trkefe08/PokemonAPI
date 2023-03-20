//
//  Pokemon.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import Foundation

struct Pokemon: Codable {
    let name: String?
    let abilities: [Ability]?
    let sprites: Sprites?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case id
        case name
        case sprites
    }
}
