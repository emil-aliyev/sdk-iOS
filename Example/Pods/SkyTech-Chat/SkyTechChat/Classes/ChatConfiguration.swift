//
//  Configuration.swift
//
//  Created by Rashad Shirizada on 28.04.22.
//

import Foundation

public struct ChatConfiguration {
    var apiKey: String
    var appID: String
    var params: [String:Any]
    
    public init(apiKey: String, appId: String, params: [String:Any]) {
        self.apiKey = apiKey
        self.appID = appId
        self.params = params
    }

    var body: Data? {
        
        return try? JSONSerialization.data(withJSONObject: params, options: [])
    }
    
    var hashKey: String? {
        if let body = body {
            let bodyStr = String(data: body, encoding: .utf8) ?? ""
            return bodyStr.hmac(algorithm: .sha256, key: "\(apiKey)\(appID)")
        }
        return nil
    }
}
