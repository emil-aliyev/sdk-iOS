//
//  ChatDelegate.swift
//
//

import Foundation

public protocol SkyTechChatDelegate {
    func didStartLoad()
    func onError(error: Error)
    func didFinishLoad()
}
