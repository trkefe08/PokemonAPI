//
//  PokemonDetailViewController.swift
//  pokemonApp
//
//  Created by Tarik Efe on 22.03.2023.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!
    @IBOutlet private weak var pokemonAbilites: UILabel!
    
    //MARK: - Variables
    var pokemonId: String?
    private var viewModel: PokemonDetailViewModelProtocol = PokemonDetailViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = pokemonId else { return }
        viewModel.delegate = self
        viewModel.fetchPokemonDetail(id: id)
    }
}

//MARK: - Extensions
extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
    func pokemonLoaded() {
        pokemonNameLabel.text = viewModel.getPokemonName()
        pokemonAbilites.text = viewModel.getPokemonAbilities()
        guard let url = viewModel.getPokemonImageURL() else { return }
        pokemonImageView.kf.setImage(with: url)
    }
}
