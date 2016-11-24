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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination.isKind(of: UIViewController.self) {
           segue.destination.title = (sender as! String)
        }
    }
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let data = self.cellIdentifiers[indexPath.row] as [String : String]!
        cell.textLabel?.text = data?["title"] as String!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let data = self.cellIdentifiers[indexPath.row] as [String : String]!
        self.performSegue(withIdentifier: data?["segueIdentifier"] as String!, sender: data?["title"])
    }
}
