//
//  PokemonData.swift
//  who is that pokemon
//
//  Created by soliduSystem on 22/02/23.
//

import Foundation

struct PokemonData : Codable {
    let results : [PokemonResults]?
}

struct PokemonResults : Codable {
    let name : String?
    let url : String?
}
