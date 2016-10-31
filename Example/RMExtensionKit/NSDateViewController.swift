//
//  NSDateViewController.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 31/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class NSDateViewController: UIViewController {

    @IBOutlet weak var textLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let birthDate = NSDate(year: 1987, month: 10, day: 08)
        
    
        let text = NSMutableString()
        text.appendString("My birth date is: \(birthDate)\n\n")
        text.appendString("The time internal of my birth date is: \(birthDate.timeInterval())\n\n")
        
        //for more format: http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        text.appendString("This is my birth date formatted: \(birthDate.toString("EEEE, dd, MMMM, yyyy"))")
        
        self.textLabel.text = text as String
    }

}
