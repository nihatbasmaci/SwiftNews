//
//  WebPageViewController.swift
//  HaberRss
//
//  Created by Nihat on 06/02/15.
//  Copyright (c) 2015 Nihatbasmaci. All rights reserved.
//

import UIKit

class WebPageViewController: UIViewController {
    
    var feedURL = ""
    
    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: feedURL)!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
