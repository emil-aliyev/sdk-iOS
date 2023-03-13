//
//  ChatManager.swift
//
//

import Foundation


public class ChatManager {
    
    public static var configuration: ChatConfiguration?
    
    
    public static var chatController: ChatController? {
        if configuration == nil {
            fatalError("Configuration is not defined")
        }
        else {
            return ChatController()
        }
    }
    
    public static func logout(deviceToken: String, appId:String) {
        if let chatController = chatController {
            chatController.logout(deviceToken: deviceToken, appId: appId)
        }
    }
    
}
