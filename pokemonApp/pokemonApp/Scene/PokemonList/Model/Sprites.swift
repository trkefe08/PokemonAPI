//
//  Sprites.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import Foundation

struct Sprites: Codable {
    let backDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
    }
}
