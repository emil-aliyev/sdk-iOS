//
//  Configuration.swift
//
//

import Foundation

public struct ChatConfiguration {
    var apiKey: String
    var appID: String
    var deviceToken: String
    var deviceOS: String
    var params: [String:Any]
    
    public init(apiKey: String, appId: String,deviceToken: String, deviceOS: String,   params: [String:Any]) {
        self.apiKey = apiKey
        self.appID = appId
        self.deviceToken = deviceToken
        self.deviceOS = deviceOS
        self.params = params
    }

    var body: Data? {
        
        return try? JSONSerialization.data(withJSONObject: params, options: [])
    }
    
    var hashKey: String? {
        if let body = body {
            let bodyStr = String(data: body, encoding: .utf8) ?? ""
            return bodyStr.hmac(key: "\(apiKey)\(appID)")
        }
        return nil
    }
}
