//
//  ViewController.swift
//  HaberRss
//
//  Created by Nihat on 04/02/15.
//  Copyright (c) 2015 Nihatbasmaci. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {
    
    var myFeed : NSArray = []
    var url: NSURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // satir yükseklik
        self.tableView.rowHeight = 60
        self.tableView.dataSource = self
        self.tableView.delegate = self
        url = NSURL(string: "http://www.sabah.com.tr/rss/sondakika.xml")!
        //loadRssfonksiyonu çağırılıyor
        loadRss(url);
        
    }
    
    func loadRss(data: NSURL) {
        // XmlParser Objesi
        var myParser : XmlParser = XmlParser.alloc().initWithURL(data) as XmlParser
        // Put feed in array
        myFeed = myParser.feeds
        
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "openPage" {
            
            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let selectedFTitle: String = myFeed[indexPath.row].objectForKey("title") as String
            let selectedFContent: String = myFeed[indexPath.row].objectForKey("description") as String
            let selectedFURL: String = myFeed[indexPath.row].objectForKey("link") as String
            
            // PageViewController
            let fpvc: PageViewController = segue.destinationViewController as PageViewController
            
            fpvc.selectedFeedTitle = selectedFTitle
            fpvc.selectedFeedFeedContent = selectedFContent
            fpvc.selectedFeedURL = selectedFURL
        }
    }
    
    
    //Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFeed.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        //dictionary.
        var dict : NSDictionary! = myFeed.objectAtIndex(indexPath.row) as NSDictionary
        
        cell.textLabel?.text = myFeed.objectAtIndex(indexPath.row).objectForKey("title") as? String
        
        cell.detailTextLabel?.text = myFeed.objectAtIndex(indexPath.row).objectForKey("pubDate") as? String
        
        return cell
    }
}
