//
//  PokemonListTableViewCell.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import UIKit
import Kingfisher

class PokemonListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!
    
    //MARK: - Methods
    
    func configureCell(pokemon: Conclusion) {
        pokemonNameLabel.text = pokemon.name
    }
    
    func configureImage(pokemonImage: Sprites) {
        guard let url = URL(string: pokemonImage.frontDefault ?? "not found") else { return }
        pokemonImageView.kf.setImage(with: url)
    }
    
}
