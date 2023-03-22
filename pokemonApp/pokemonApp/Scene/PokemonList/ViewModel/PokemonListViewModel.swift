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
    func fetchPokemonImage(for index: Int)
    func getPokemonCount() -> Int
    func getPokemon(at index: Int) -> Conclusion?
    func getPokemonImage(at index: Int) -> Sprites?
    func getPokemonId(at index: Int) -> String?
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
    private var pokemonIMG: [String:Sprites] = [:]
    private var id = 0
    
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
    
    func fetchPokemonImage(for index: Int) {
        guard let pokemon = pokemon?[index], let url = URL(string: pokemon.url ?? ""), let id = url.pathComponents.last else {
            return
        }
        PokemonDBCLient.shared.getPokemonImage(with: id) { [weak self] result in
            switch result {
            case .success(let results):
                guard let sprites = results?.sprites else {
                    return
                }
                self?.pokemonIMG.updateValue(sprites, forKey: pokemon.name ?? "")
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
    
    func getPokemonId(at index: Int) -> String? {
        pokemon?[index].url
    }
    
    func getPokemonImage(at index: Int) -> Sprites? {
        guard let pokemon = pokemon?[index], let pokemonIMG = pokemonIMG[pokemon.name ?? ""] else {
            fetchPokemonImage(for: index)
            return nil
        }
        return pokemonIMG
    }
}
