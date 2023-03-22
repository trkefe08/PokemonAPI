//
//  PokemonDetailViewModel.swift
//  pokemonApp
//
//  Created by Tarik Efe on 22.03.2023.
//

import UIKit

//MARK: - Protocol
protocol PokemonDetailViewModelProtocol {
    var delegate: PokemonDetailViewModelDelegate? { get set }
    func fetchPokemonDetail(id: String)
    func getPokemonImageURL() -> URL?
    func getPokemonName() -> String?
    func getPokemonAbilities() -> String?
}

//MARK: - Delegate
protocol PokemonDetailViewModelDelegate: AnyObject {
    func pokemonLoaded()
}

//MARK: - Class
final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    //MARK: - Variables
    weak var delegate: PokemonDetailViewModelDelegate?
    private var pokemon: PokemonDetail?
    private var pokemonAbility: Ability?
    
    //MARK: - Methods
    func fetchPokemonDetail(id: String) {
        PokemonDBCLient.shared.getPokemonDetail(with: id) { [weak self] result in
            switch result {
            case .success(let results):
                self?.pokemon = results
                self?.delegate?.pokemonLoaded()
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getPokemonImageURL() -> URL? {
        URL(string: pokemon?.sprites?.frontDefault ?? "")
    }
    
    func getPokemonName() -> String? {
        pokemon?.name ?? "Not Found"
    }
    
    func getPokemonAbilities() -> String? {
        let abilities = pokemon?.abilities?.compactMap { $0.ability?.name }
        return abilities?.joined(separator: ", ")
    }
}
