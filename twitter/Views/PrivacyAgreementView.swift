//
//  PrivacyAgreementView.swift
//  twitter
//
//  Created by Karon Bell on 5/2/23.
//

import Foundation
import UIKit
import WebKit

//



class PrivacyAgrrementView: UIViewController, WKNavigationDelegate {

    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        

    
        DispatchQueue.main.async {
            // Create a WKWebView instance
            
        
            self.webView = WKWebView(frame: self.view.bounds)
            self.webView.navigationDelegate = self
            self.view.addSubview(self.webView)
            
            DispatchQueue.global(qos: .background).async {
                
            }
            // Load the URL
            if let url = URL(string: "https://cdn.cms-twdigitalassets.com/content/dam/legal-twitter/site-assets/privacy-june-10-2022/Twitter_Privacy_Policy_EN.pdf") {
                
                DispatchQueue.main.async {
                    self.webView.load(URLRequest(url: url))
                    self.webView.allowsBackForwardNavigationGestures = true
                }
                   
                
             
            }
        }
      
    }

    // WKNavigationDelegate method to handle the loading of web pages
    
    //
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
       
            self.title = webView.title
        
       
    }
}
