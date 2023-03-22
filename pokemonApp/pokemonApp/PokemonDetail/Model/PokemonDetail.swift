//
//  PokemonDetail.swift
//  pokemonApp
//
//  Created by Tarik Efe on 22.03.2023.
//

import Foundation

struct PokemonDetail: Codable {
    let abilities: [Ability]?
    let name: String?
    let id: Int?
    let sprites: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case id
        case name
        case sprites
    }
}
