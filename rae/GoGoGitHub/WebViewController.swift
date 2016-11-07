//
//  WebViewController.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 11/3/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let webView = WKWebView()
    
    var webURL: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.frame
        self.view.addSubview(webView)
        
        if let url = URL(string: webURL){
            let request = URLRequest(url: url)
            
            self.webView.load(request)
        }

    }

}
