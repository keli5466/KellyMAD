//
//  SecondViewController.swift
//  lab6
//
//  Created by Kelly Linehan on 10/9/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UIWebViewDelegate {
                            
    @IBOutlet weak var musicWebView: UIWebView!
    @IBOutlet weak var musicSpinner: UIActivityIndicatorView!
    
    
    func loadWedPage(urlString: String){
        let url = NSURL.URLWithString(urlString)
        let request = NSURLRequest(URL: url)
        musicWebView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        musicWebView.delegate=self
        loadWedPage("https://www.apple.com/itunes")
        super.viewDidLoad()
    
    }
    func webViewDidStartLoad(webView: UIWebView) {
        musicSpinner.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        musicSpinner.stopAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }


}

