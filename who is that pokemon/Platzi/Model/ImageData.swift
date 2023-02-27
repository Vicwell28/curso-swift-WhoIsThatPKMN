//
//  ImageData.swift
//  who is that pokemon
//
//  Created by soliduSystem on 22/02/23.
//

import Foundation

struct ImageData : Codable {
    let sprites : Sprites
}

class Sprites : Codable {
    let other : OtherImage?
    
    init(other: OtherImage?) {
        self.other = other
    }
}

struct OtherImage : Codable {
    let officialArtwork :OfficialArtwork?
    
    enum CodingKeys : String, CodingKey {
        case officialArtwork = "official-artwork"
    }
    
}

struct OfficialArtwork : Codable {
    let frontDefault : String?
    
    enum CodingKeys : String, CodingKey {
        case frontDefault = "front_default"
    }
}
