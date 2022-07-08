//
//  ChatDelegate.swift
//
//  Created by Rashad Shirizada on 03.05.22.
//

import Foundation

public protocol SkyTechChatDelegate {
    func didStartLoad()
    func onError(error: Error)
    func didFinishLoad()
}
