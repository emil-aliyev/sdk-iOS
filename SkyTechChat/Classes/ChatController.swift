//
//  ChatController.swift
//
//

import UIKit
import WebKit

public class ChatController: UIViewController {
    private var configurationManager = ConfigurationManager()
    private lazy var webview: WKWebView = {
        let webView = WKWebView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
//    private let configurationManager: ConfigurationManager
    
    public var delegate: SkyTechChatDelegate?
    public var isChatOnScreen: ((Bool) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadChat()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isChatOnScreen?(true)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webview.evaluateJavaScript("MainLivechatInitializer('blurInput')")
        isChatOnScreen?(false)
    }
    
    public func openRateMessageById(messageId: String) {
        let jsCode = "MainLivechatInitializer('openRateMessageById', \(messageId)"
        self.webview.evaluateJavaScript(jsCode)
    }
    
    public func runExternalJavaScriptCode(jsCode: String) {
        self.webview.evaluateJavaScript(jsCode)
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
                    DispatchQueue.main.async {
                        self.delegate?.onError(error: error)
                    }
                }
            }
        }
    }
    
    func logout(deviceToken: String, appId: String) {
        WebCacheCleaner.clean()
        self.configurationManager.logout(deviceToken: deviceToken, appId: appId) { result in
            switch result {
            case .success(let response):
                print("success")
            case .failure(let error):
                DispatchQueue.main.async {
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
   
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("decision handler")
        guard let url = navigationAction.request.url else { // else will be called when url is nil
           decisionHandler(.cancel)
           return
        }

        if ( url.description.lowercased().starts(with: "http://") ||
           url.description.lowercased().starts(with: "https://") ) &&
            !url.description.lowercased().contains("https://skybot-widget-api.kapitalbank.az/") {
               decisionHandler(.allow)
            UIApplication.shared.open(url, options: [:], completionHandler: nil)

        } else {
              decisionHandler(.allow)
        }
    }
}
