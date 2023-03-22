//
//  PokemonListViewController.swift
//  pokemonApp
//
//  Created by Tarik Efe on 20.03.2023.
//

import UIKit

final class PokemonListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var pokemonListTableView: UITableView! {
        didSet {
            pokemonListTableView.dataSource = self
            pokemonListTableView.delegate = self
            pokemonListTableView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
        }
    }
    //MARK: - Variables
    private var viewModel: PokemonListViewModelProtocol = PokemonListViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchPokemonList()
        //print(viewModel.fetchPokemonImage())
        
    }
}

//MARK: - Extensions
extension PokemonListViewController: PokemonListViewModelDelegate {
    func pokemonLoaded() {
        pokemonListTableView.reloadData()
    }
}

extension PokemonListViewController: UITableViewDelegate {
    
}

extension PokemonListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getPokemonCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as? PokemonListTableViewCell, let model = viewModel.getPokemon(at: indexPath.section), let modelImage = viewModel.getPokemonImage(at: indexPath.section) else { return UITableViewCell() }
        cell.configureCell(pokemon: model)
        cell.configureImage(pokemonImage: modelImage)
        return cell
    }
    
    
}
