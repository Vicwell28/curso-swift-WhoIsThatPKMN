//
//  PokemonManager .swift
//  who is that pokemon
//
//  Created by soliduSystem on 22/02/23.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemon : [pokemonModel])
    func didFailWithError(error : Error)
}


struct PokemonManager {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=100"
    var delegate : PokemonManagerDelegate?
    
    public func fetchPokemon() {
        self.performRequest(with: self.pokemonURL)
    }
    
    
    private func performRequest(with urlString : String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { Data, URLResponse, Error in
            if Error != nil {
                print("performRequest didFailWithError")
                self.delegate?.didFailWithError(error: Error!)
            }
            
            if let safeData = Data {
                if let pokemon = self.parseJSON(pokemonData: safeData){
                    print("performRequest didUpdatePokemon")
                    self.delegate?.didUpdatePokemon(pokemon: pokemon)
                }
            }
        }
        task.resume()
    }
    
    
    
    
    private func parseJSON(pokemonData : Data) -> [pokemonModel]? {
        do {
            let decodeData = try JSONDecoder().decode(PokemonData.self, from: pokemonData)
            let pkemon = decodeData.results?.map({ PokemonResults in
                pokemonModel(name: PokemonResults.name ?? "", imageURL: PokemonResults.url ?? "")
            })
            return pkemon
        } catch {
            return nil
        }
    }
}
