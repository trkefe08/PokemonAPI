//
//  Ability.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import Foundation

struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
