//
//  PokemonListViewModel.swift
//  pokemonApp
//
//  Created by Tarik Efe on 21.03.2023.
//

import UIKit

//MARK: - Protocol
protocol PokemonListViewModelProtocol {
    var delegate: PokemonListViewModelDelegate? { get set }
    func fetchPokemonList()
    func getPokemonCount() -> Int
}

//MARK: - Delegate
protocol PokemonListViewModelDelegate: AnyObject {
    func pokemonLoaded()
}

//MARK: - Class
final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    //MARK: - Variables
    weak var delegate: PokemonListViewModelDelegate?
    private var pokemon: Pokemon?
    
    //MARK: - Methods
    func fetchPokemonList() {
        PokemonDBCLient.shared.getPokemonList { [weak self] result in
            switch result {
            case .success(let results):
                self?.pokemon = results
                self?.delegate?.pokemonLoaded()
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getPokemonCount() -> Int {
        return pokemon?.name?.count ?? 0
    }
}
