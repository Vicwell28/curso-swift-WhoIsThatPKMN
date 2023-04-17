//
//  Api_Escaping.swift
//  who is that pokemon
//
//  Created by soliduSystem on 17/04/23.
//

import Foundation


final class Api_Escaping {
    
    typealias RequestCompletion = (_ res: Data?, _ err: String?, _ httpResponse: HTTPURLResponse?) -> Void
    
    
    static func request(endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        print("\n\n#########################################################\n")

        
        guard let request = buildRequest(for: endpoint) else { return }
        
       
        
        //        configureParameters(request: &request, endpoint)
        
        
        print("######## Req.url: \(String(describing: request.url))")
        print("######## Req.httpMethod: \(String(describing: request.httpMethod))")
        print("######## Req.httpBody: \(String(describing: request.httpBody))")

        self.startRequestTask(request: request, endpoint: endpoint, completion: completion)
    }
    
    static func faildRequest(by msg: String) {
        print("######## Faild: \(msg) \n")
        print("#########################################################")
    }
    
    static func buildRequest(for endpoint: ApiEndPoint) -> URLRequest? {
        
        guard let url = URLComponents(string: self.url)?.url else {
            self.faildRequest(by: "URL INVALIDA")
            return nil
            
        }
        
        var request = URLRequest(
            url: url,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 20)
        
        
        request.httpMethod = self.getMethod(for: endpoint).rawValue
        
        
        for (key, value) in getHeaders(for: endpoint) {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    
    
    static func startRequestTask(request: URLRequest, endpoint: ApiEndPoint, completion: @escaping RequestCompletion) -> Void {
        
        
        URLSession.shared.dataTask(with: request) { (data, urlRes, err) in
            
            guard let urlRes = urlRes as? HTTPURLResponse else {
                self.faildRequest(by: "NO RESPONSE for request.")
                completion(nil, "No se pudo obtener la información del servidor", nil)
                return
            }
            
            if err != nil {
                self.faildRequest(by: err!.localizedDescription)
                completion(nil, err!.localizedDescription, urlRes)
                return
            }
            
            
            if data != nil {
                self.faildRequest(by: err!.localizedDescription)
                completion(nil, err!.localizedDescription, urlRes)
                return
            }
            
            completion(data, nil, urlRes)
                        
        }.resume()
        
    }
    
}
