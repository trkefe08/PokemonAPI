//
//  Collection+Safe.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
