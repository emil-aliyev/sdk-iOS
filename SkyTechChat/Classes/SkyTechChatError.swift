//
//  SkyTechChatError.swift
//
//

import Foundation

enum SkyTechChatError: Error, LocalizedError {
    case notDefinedStatusCode
    case custom(errorCode: Int)
    case unauthorized(message: String)
    
    
    var errorDescription: String? {
        switch self {
        case .notDefinedStatusCode:
            return "Statuscode is not defined"
        case .custom(let errorCode):
            return "Error - \(errorCode)"
        case .unauthorized(let message):
            return message
        }
    }
}

