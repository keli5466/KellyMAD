//
//  DetailViewController.swift
//  lab9
//
//  Created by Kelly Linehan on 11/4/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!

    func loadWebPage(urlString: String){
        let url = NSURL(string:urlString)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    var detailItem: AnyObject? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
  
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                self.loadWebPage(detail.description)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
