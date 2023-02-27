//
//  ImageManager.swift
//  who is that pokemon
//
//  Created by soliduSystem on 22/02/23.
//

import Foundation

protocol ImageMangerDelegate {
    func didResponseImagePokemon(pokemonImage : ImageModel?, error : Error?)
}

class ImageManager {
    
    var delegate : ImageMangerDelegate?
    
    func fetchRequest(with urlString  : String) {
        self.performRequest(with: urlString)
    }
    
    private func performRequest(with urlString : String){
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { Data, URLResponse, Error in
            if Error != nil {
                self.delegate?.didResponseImagePokemon(pokemonImage: nil, error: Error!)
            }
            
            if let safeData = Data {
                if let pokemon = self.parseJSON(pokemonData: safeData) {
                    self.delegate?.didResponseImagePokemon(pokemonImage: pokemon, error: nil)
                }
            }
            
        }
        task.resume()
    }
    
    private func parseJSON(pokemonData : Data) -> ImageModel? {
        do {
            let decodeData = try JSONDecoder().decode(ImageData.self, from: pokemonData)
            let image = decodeData.sprites.other?.officialArtwork?.frontDefault ?? ""
            return ImageModel(imgaeURL: image)
        } catch {
            return nil
        }
    }
    
}
