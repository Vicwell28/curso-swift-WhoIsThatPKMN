//
//  API+Escaping.swift
//  who is that pokemon
//
//  Created by soliduSystem on 01/03/23.
//

import Foundation

final class Api_Escaping {
    
    typealias RequestCompletion = (_ data : Data?, _ err : String?, _ response : HTTPURLResponse?) -> Void
    
    
    static func request(endpoint : ApiEndPoint, completion : @escaping RequestCompletion) {
        
        print("1. Entra al request para construrir la request con el endpoint : \(endpoint) y el compleation : \(String(describing: completion))")
        
        guard var request = buildRequest(for: endpoint) else {
            print("request could not being built!")
            return
        }
        
        print("5. En este punto se pudo crear el reuqest que es este req : \(request) ")
        
        
        print(":: New request to: \(request.url?.absoluteString ?? "NO URL!") ::\n")
        
        print("- METHOD:", request.httpMethod ?? "")
        
        print("- HEADERS:")
        
        print("7. lo que nos regresara el getHeaderForEndporn se lo vamos a inyecta al reqest con el sevalue Respuesta \(getHeaders(for: endpoint))")
        
        for (key, value) in getHeaders(for: endpoint) {
            
            print("8. key : \(key) value : \(value) ")
            
            request.setValue(value, forHTTPHeaderField: key)
            print("key:", key, "value:", value)
        }
        
        print("9. request : \(request) ")
        
        
        configureParameters(request: &request, endpoint)
        
        startRequestTask(request, endpoint: endpoint, completion: completion)
    }
    
    static private func buildRequest(for endpoint: ApiEndPoint) -> URLRequest? {
        
        print("2. Entramos al metodo buildRequestForEndpoint para consturi la request pro el endpoitn donde le pasamos por parametro el endpoint \(endpoint)")
        
        
        
        guard let urlComp = URLComponents(string: url)?.url else {
            return nil
        }
        
        print("3. En este punot tenemos que tener nuestro endpoint prinicpal listo para hacer peticiones url : \(urlComp)")
        
        var request = URLRequest(url: URL(string: "\(urlComp)\(getPath(for: endpoint))")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        request.httpMethod = getMethod(for: endpoint).rawValue
        
        print(getMethod(for: endpoint).rawValue)
        
        print("4. Este metodo lo que regresa el el request ya creado entonces tenemos que el request el res : \(request)")
        
        return request
    }
    
    
    
    static private func configureParameters(request: inout URLRequest, _ endpoint: ApiEndPoint) {
        
        print("11. vamos a configurar los parametros del request esto haciendo referencia al mimso request que le pasamos al paramteo request : \(request) y el endpoint \(endpoint)")
        
        
        
        print("12. obtendremso lso parametros del body para el endpon en cueston : \(String(describing: getBodyParam(for: endpoint))) ")
        
        if let bodyParameters = getBodyParam(for: endpoint) {
            
            setBodyParams(urlRequest: &request, parameters: bodyParameters)
            print("- BODY PARAMS:")
            print(bodyParameters)
        }
        
        
    }
    
    
    static private func setBodyParams(urlRequest: inout URLRequest, parameters: [String: Any]) {
        
        print("12.2 Vamos a  set el body params donde tenemos el id del request \(urlRequest) y tambine nos pasan los parametros : \(parameters)")
        
        if let jsonAsData = try? JSONSerialization.data(withJSONObject: parameters) {
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
    }
    
    
    private static func startRequestTask(_ request: URLRequest, endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        print("14. Vamos a iniciar la tarea del request request : \(request) endpoint \(endpoint) compleation \(String(describing: completion))")
        
        let task = URLSession.shared.dataTask(with: request) { (data, urlRes, err) in
            
            guard let urlRes = urlRes as? HTTPURLResponse else {
                print("-- NO RESPONSE for request. --")
                completion(nil, "No se pudo obtener la información del servidor", nil)
                return
            }
            
            if err != nil {
                print("1...")
                completion(nil, "No se pudo obtener la información del servidor", urlRes)
                return
            }
            
            self.handleRequestResponse(urlRes, data: data, forRequest: request, ofEndpoint: endpoint, completion: completion)
        }
        
        task.resume()
    }
    
    
    
    static private func handleRequestResponse(_ urlRes: HTTPURLResponse, data: Data?, forRequest req: URLRequest, ofEndpoint endpoint: ApiEndPoint, completion: @escaping RequestCompletion) {
        
        print("15. el manejador del de la respuesta del request \n HTTPURLResponse : \(urlRes) \n Data : \(String(describing: data)) \n URLRequest : \(req) \n ApiEndPoint : \(endpoint) \n completion : \(String(describing: completion))")
        
        if data != nil {
            print("-- RESPONSE DATA for url \(req.url?.absoluteString ?? "NO URL!"):", String(data: data!, encoding: .utf8)!)
        }
        print("-- STATUS CODE: \(urlRes.statusCode)")
        switch urlRes.statusCode {
        case 200..<400:
            completion(data, nil, urlRes)
//        case 401:
//            switch endpoint {
//            default:
//                self.request(endpoint: .refreshToken(LocalPreferences.shared.refreshToken!), completion: completion)
//            }
        default:
            completion(data, "Error desconocido al conectar con el servidor", urlRes)
            return
        }
    }
    
    
}


