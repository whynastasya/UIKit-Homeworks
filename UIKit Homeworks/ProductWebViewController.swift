//
//  ProductWebViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.04.2023.
//

import UIKit
import WebKit

final class ProductWebViewController: UIViewController {

    var productURL = ""
    
    private var webView = WKWebView()
    private let toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        let myURL = URL(string: productURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        let forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goForward))
        let backwardButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goBackward))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.frame = CGRectMake(0, 720, 400, 100)
        toolbar.sizeToFit()
        toolbar.tintColor = .black
        toolbar.setItems([backwardButton, forwardButton, spacer, refreshButton], animated: true)
        view.addSubview(toolbar)
    }
    
    @objc func goForward() {
        webView.goForward()
    }
    
    @objc func goBackward() {
        webView.goBack()
    }
    
    @objc func refresh() {
        webView.reload()
    }
}

extension ProductWebViewController: WKUIDelegate {
}
