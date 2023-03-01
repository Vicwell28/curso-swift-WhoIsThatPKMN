//
//  API+Escaping+Env.swift
//  who is that pokemon
//
//  Created by soliduSystem on 01/03/23.
//

import Foundation


extension Api_Escaping {
    
    enum APIENV {
        case localhost
        case qa
        case produ
    }
    
    
    
    static var env : APIENV = .localhost
    
    
    
    static var PASSWORD: String {
        switch env {
        case .localhost:
            return ""
        case .produ:
            return ""
        case .qa:
            return ""
        }
    }
    
    
    
    private static let FORM_DATA_LINE_BREAK = "\r\n"
    
    
    
    static var url: String {
        switch env {
        case .localhost:
            return "https://pokeapi.co/api/v2/"
        case .qa:
            return "https://pokeapi.co/api/v2/"
        case .produ:
            return "https://pokeapi.co/api/v2/"
        }
    }
}
