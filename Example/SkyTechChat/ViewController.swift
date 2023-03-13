//
//  ViewController.swift
//  SkyTechChat

import UIKit
import SkyTech_Chat

class ViewController: UIViewController {
    private lazy var openChatBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Start Chat", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(openChat), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    @objc func openChat() {
        if let chatController = ChatManager.chatController {
            chatController.delegate = self
            self.navigationController?.pushViewController(chatController, animated: true)
            
        }
    }
    
    private func setupView() {
        self.view.addSubview(openChatBtn)
        NSLayoutConstraint.activate([
            openChatBtn.heightAnchor.constraint(equalToConstant: 60),
            openChatBtn.widthAnchor.constraint(equalToConstant: 100),
            openChatBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            openChatBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
}


extension ViewController: SkyTechChatDelegate {
    func didStartLoad() {
        print("Start to load")
    }
    
    func onError(error: Error) {
        DispatchQueue.main.async {
            AlertController.showError(message: error.localizedDescription, in: self)
        }
    }
    
    func didFinishLoad() {
        print("Did finish load")
    }
    
    
}
