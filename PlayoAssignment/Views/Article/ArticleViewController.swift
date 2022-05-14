//
//  WebViewController.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation
import UIKit
import WebKit
class ArticleViewController: UIViewController,WKNavigationDelegate{
    
    var webView = WKWebView()
    var url: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.frame = view.frame
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        
    }
}
