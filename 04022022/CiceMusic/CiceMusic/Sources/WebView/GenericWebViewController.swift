//
//  GenericWebViewController.swift
//  CiceMusic
//
//  Created by TECDATA ENGINEERING on 16/2/22.
//

import UIKit
import WebKit

protocol GenericWebOutputPresenterProtocol{
    
}

class GenericWebViewController: UIViewController {

    // MARK: - ID
    var presenter: GenericWebPresenterInputProtocol?
    
    // MARK: - Variables globales
    var myWebViewInContainer: WKWebView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    // MARK: IBOutlets
    @IBOutlet weak var contentWebView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate.canRotate = true
        self.configuracionWebView()
        self.loadWebView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.appDelegate.canRotate = false
    }
    
    private func configuracionWebView() {
        self.title = "Cice Music Web"
        self.myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        
        let contentWebView = WKUserContentController()
        let config = WKWebViewConfiguration()
        let prefers = WKWebpagePreferences()
        
        prefers.allowsContentJavaScript = true
        self.myWebViewInContainer = WKWebView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: Int(self.contentWebView.frame.width),
                                                            height: Int(self.contentWebView.frame.height)),
                                              configuration: config)
        self.myWebViewInContainer.configuration.userContentController = contentWebView
        self.myWebViewInContainer.navigationDelegate = self
        
        self.contentWebView.addSubview(self.myWebViewInContainer)
        
    }
    
    private func loadWebView() {
        guard let urlUnw = URL(string: "http://www.icologic.co") else { return }
        self.myWebViewInContainer.load(URLRequest(url: urlUnw))
        
    }



}

extension GenericWebViewController: GenericWebOutputPresenterProtocol {
    
}

extension GenericWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        
        self.myActivityIndicator.isHidden = true
        self.myActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
        
    }
    
    func webView(_ webView: WKWebView,
                 didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //
    }
}
