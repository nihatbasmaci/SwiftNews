//
//  PageViewController.swift
//  HaberRss
//
//  Created by Nihat on 04/02/15.
//  Copyright (c) 2015 Nihatbasmaci. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()
    var selectedFeedURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.editable = false
        textView.contentInset = UIEdgeInsets(top: +60,left: 0,bottom: 0,right: 0)
        
        textView.text = "\(selectedFeedTitle)\n\n\(selectedFeedFeedContent)"
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "openWebPage" {
            
            let fwpvc: WebPageViewController = segue.destinationViewController as WebPageViewController
            selectedFeedURL =  selectedFeedURL.stringByReplacingOccurrencesOfString(" ", withString:"")
            selectedFeedURL =  selectedFeedURL.stringByReplacingOccurrencesOfString("\n", withString:"")
            fwpvc.feedURL = selectedFeedURL
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
