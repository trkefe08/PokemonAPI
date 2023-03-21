//
//  Pokemon.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import Foundation

struct Pokemon: Codable {
    let count: Int?
    let next: String?
    let results: [Conclusion]?
}
