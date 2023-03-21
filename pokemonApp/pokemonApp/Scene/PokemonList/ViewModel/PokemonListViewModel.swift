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
    func getPokemon(at index: Int) -> Conclusion?
    func getGamesId(at index: Int) -> String?

}

//MARK: - Delegate
protocol PokemonListViewModelDelegate: AnyObject {
    func pokemonLoaded()
}

//MARK: - Class
final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    //MARK: - Variables
    weak var delegate: PokemonListViewModelDelegate?
    private var pokemon: [Conclusion]? = []
    
    //MARK: - Methods
    func fetchPokemonList() {
        PokemonDBCLient.shared.getPokemonList { [weak self] result in
            switch result {
            case .success(let results):
                self?.pokemon = results?.results
                self?.delegate?.pokemonLoaded()
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getPokemonCount() -> Int {
        return pokemon?.count ?? 0
    }
    
    func getPokemon(at index: Int) -> Conclusion? {
        return pokemon?[index]
    }
    
    func getGamesId(at index: Int) -> String? {
        pokemon?[index].url
    }

}
