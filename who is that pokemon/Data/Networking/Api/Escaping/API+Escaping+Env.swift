//
//  API+Escaping+Env.swift
//  who is that pokemon
//
//  Created by soliduSystem on 01/03/23.
//

import Foundation


extension Api_Escaping {
    
    private static let FORM_DATA_LINE_BREAK = "\r\n"

    static var env : APIENV = .localhost

    
    enum APIENV {
        case localhost
        case qa
        case produ
    }
    
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



extension Api_EscapingTest {
    
    private static let FORM_DATA_LINE_BREAK = "\r\n"

    static var env : APIENV = .localhost

    enum APIENV {
        case localhost
        case qa
        case produ
    }
    
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

