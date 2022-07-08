//
//  LoadableResponse.swift
//
//  Created by Rashad Shirizada on 28.04.22.
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
