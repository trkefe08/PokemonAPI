//
//  PokemonDBClient.swift
//  pokemonApp
//
//  Created by Tarik Efe on 20.03.2023.
//

import Foundation

final class PokemonDBCLient {
    
    static let shared = PokemonDBCLient()
    private init() {}
    
    //MARK: - Request
    func makeRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    //MARK: - PokemonList Screen Methods
    func getPokemonList(completion: @escaping (Result<Pokemon?, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)pokemon") else { return }
        makeRequest(url: url, completion: completion)
    }
}
