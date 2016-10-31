//
//  MenuViewController.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 31/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var cellIdentifiers = [
        ["segueIdentifier" : "sampleHTMLIdentifier", "title" : "HTML Text Sample"],
        ["segueIdentifier" : "NSDateSampleIdentifier", "title" : "NSDate Sample"],
    ]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.destinationViewController.isKindOfClass(UIViewController) {
           segue.destinationViewController.title = (sender as! String)
        }
    }
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellIdentifiers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let data = self.cellIdentifiers[indexPath.row] as [String : String]!
        cell.textLabel?.text = data["title"] as String!
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let data = self.cellIdentifiers[indexPath.row] as [String : String]!
        self.performSegueWithIdentifier(data["segueIdentifier"] as String!, sender: data["title"])
    }
}
