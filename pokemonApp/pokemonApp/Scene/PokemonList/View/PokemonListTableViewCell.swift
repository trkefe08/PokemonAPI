//
//  PokemonListTableViewCell.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!
    
    //MARK: - Methods
    
    func configureCell(pokemon: Conclusion) {
        pokemonNameLabel.text = pokemon.name
    }
}
