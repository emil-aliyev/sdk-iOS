//
//  ConfigurationManager.swift
//
//  Created by Rashad Shirizada on 28.04.22.
//

import Foundation


class ConfigurationManager {
    
    
    
    func getLoadableUrl(configuration: ChatConfiguration,completion: @escaping ((Result<TokenResponse, Error>)->())) {
        
        sendApiRequest(configuration: configuration, completion: completion)
    }
    
    func sendApiRequest(configuration: ChatConfiguration, completion: @escaping ((Result<TokenResponse, Error>)->())) {
        let url = URL(string: "https://widget-api.kapitalbank.az/sdk/auth")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = configuration.body
        request.setValue(configuration.appID, forHTTPHeaderField: "X-APP-ID")
        request.setValue(configuration.hashKey ?? "", forHTTPHeaderField: "X-HASH-VALUE")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode
            else { completion(.failure(SkyTechChatError.notDefinedStatusCode)); return }
            switch statusCode {
            case 200, 201:
                if let data = data {
                    do {
                        let body = try JSONDecoder().decode(TokenResponse.self, from: data)
                        completion(.success(body))
                    }
                    
                    catch {
                        completion(.failure(error))
                    }
                }
                
            case 401:
                if let data = data {
                    do {
                        let body = try JSONDecoder().decode(ErrorBody.self, from: data)
                        completion(.failure(SkyTechChatError.unauthorized(message: body.message ?? "")))
                    }
                    catch {
                        completion(.failure(error))
                    }
                }
            default:
                completion(.failure(SkyTechChatError.custom(errorCode: statusCode)))
            }
            
        }.resume()
    }
}
