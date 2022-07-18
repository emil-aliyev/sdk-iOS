//
//  ChatManager.swift
//
//  Created by Rashad Shirizada on 28.04.22.
//

import Foundation


public class ChatManager {
    
    public static var configuration: ChatConfiguration?
    
    
    public static var chatController: ChatController? {
        if let configuration = configuration {
            return ChatController(configuration: configuration)
        }
        else {
            fatalError("Configuration is not defined")

        }
    }
    
}
