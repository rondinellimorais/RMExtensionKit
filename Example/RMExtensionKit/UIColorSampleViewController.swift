//
//  UIColorSampleViewController.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/03/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class UIColorSampleViewController: UIViewController {
    
    @IBOutlet weak var boxView:UIView!
    @IBOutlet weak var opacityTextLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
    }
    
    internal func changeColor(){
        self.boxView.backgroundColor = UIColor.random()
        self.opacityTextLabel.text = String(format: "Opacity %.2f", self.boxView.backgroundColor!.cgColor.alpha)
        self.boxView.layer.borderColor = UIColor.random(alpha: 1.0).cgColor
        self.boxView.layer.borderWidth = 1.0
    }
}
