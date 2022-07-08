//
//  ChatController.swift
//
//  Created by Rashad Shirizada on 28.04.22.
//

import UIKit
import WebKit

public class ChatController: UIViewController {
    internal static let shared = ChatController(configurationManager: ConfigurationManager())
    
    private lazy var webview: WKWebView = {
        let webView = WKWebView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let configurationManager: ConfigurationManager
    
    public var delegate: SkyTechChatDelegate?
    private init(configurationManager: ConfigurationManager) {
        self.configurationManager = configurationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadChat()
    }
    
    private func loadChat() {
        if let configuration = ChatManager.configuration {
            self.configurationManager.getLoadableUrl(configuration: configuration) { result in
                switch result {
                case .success(let response):
                    if let url = response.loadableUrl {
                        DispatchQueue.main.async {
                            self.webview.load(URLRequest(url: url))
                        }
                    }
                case .failure(let error):
                    self.delegate?.onError(error: error)
                }
            }
        }
    }
  
    private func setupView() {
        self.view.addSubview(webview)
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: self.view.topAnchor),
            webview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
extension ChatController : WKUIDelegate, WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.delegate?.didStartLoad()
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.delegate?.didFinishLoad()
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.delegate?.onError(error: error)
    }
    
}
