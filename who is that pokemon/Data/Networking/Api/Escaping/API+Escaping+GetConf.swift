//
//  API+Escaping+GetConf.swift
//  who is that pokemon
//
//  Created by soliduSystem on 01/03/23.
//

import Foundation

extension Api_Escaping {
    
    static func getMethod(for ApiEndpoint : ApiEndPoint) -> HTTPMethods {
        switch ApiEndpoint {
        case .getIndexPokemons:
            return .get
        }
    }
    
    
    
    static func getPath(for ApiEndpoint : ApiEndPoint) ->  String {
        switch ApiEndpoint {
        case .getIndexPokemons(let limit):
            return "pokemon?limit=\(limit)"
        }
    }
    
    
    
    static func getHeaders(for ApiEndpont : ApiEndPoint) -> [String : String] {
        
        var header : [String : String] = [:]
        
        header.updateValue("application/json", forKey: "Content-Type")
        header.updateValue("application/json", forKey: "Accept")
        
//        switch ApiEndpont {
//        case .getIndexPokemons:
//
//            return header
//        }
        return header
    }
    
    
    
    static func getBodyParam(for ApiEndpont : ApiEndPoint) -> [String : Any]? {
        switch ApiEndpont {
        default :
            return [:]
        }
    }
    
    
    
}


extension Api_EscapingTest {
    
    static func getMethod(for ApiEndpoint : ApiEndPoint) -> HTTPMethods {
        switch ApiEndpoint {
        case .getIndexPokemons:
            return .get
        }
    }
    
    
    
    static func getPath(for ApiEndpoint : ApiEndPoint) ->  String {
        switch ApiEndpoint {
        case .getIndexPokemons(let limit):
            return "pokemon?limit=\(limit)"
        }
    }
    
    
    
    static func getHeaders(for ApiEndpont : ApiEndPoint) -> [String : String] {
        
        var header : [String : String] = [:]
        
        switch ApiEndpont {
        case .getIndexPokemons:
            header.updateValue("application/json", forKey: "Content-Type")
            header.updateValue("application/json", forKey: "Accept")
            print("HEADERS : \(header)")
            return header
        }
    }
    
    
    
    static func getBodyParam(for ApiEndpont : ApiEndPoint) -> [String : Any]? {
        switch ApiEndpont {
        default :
            return [:]
        }
    }
    
    
    
}

