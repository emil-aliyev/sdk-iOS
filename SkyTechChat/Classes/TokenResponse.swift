//
//  LoadableResponse.swift
//
//

import Foundation

struct TokenResponse : Decodable {
    var url: String?
    
    var loadableUrl: URL? {
        if let urlStr = url {            
            return URL(string: urlStr)
        }
        return nil
    }
}
