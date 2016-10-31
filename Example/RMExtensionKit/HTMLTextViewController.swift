//
//  ViewController.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 10/31/2016.
//  Copyright (c) 2016 Rondinelli Morais. All rights reserved.
//

import UIKit
import RMExtensionKit

class HTMLTextViewController: UIViewController {
    
    @IBOutlet weak var htmlTextLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let htmlString = "<span style='color:red'>Hello world!</span><br/><span>This is a simple HTML text. This is <b>bold!</b></span>"
        self.htmlTextLabel.attributedText = htmlString.toHTML()
    }
}

