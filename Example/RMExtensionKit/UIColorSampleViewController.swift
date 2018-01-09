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
    @IBOutlet weak var hexBoxView:UIView!
    @IBOutlet weak var opacityTextLabel:UILabel!
    @IBOutlet weak var hexdecimalTextLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeRGBAColor), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeHEXColor), userInfo: nil, repeats: true)
    }
    
    @objc internal func changeRGBAColor(){
        UIView.animate(withDuration: 1.0) {
            self.boxView.backgroundColor = UIColor.random()
            self.opacityTextLabel.text = String(format: "Opacity %.2f", self.boxView.backgroundColor!.cgColor.alpha)
            self.boxView.layer.borderColor = UIColor.random(alpha: 1.0).cgColor
            self.boxView.layer.borderWidth = 1.0
        }
    }
    
    @objc internal func changeHEXColor() {
        
        let hexDecimalString = randomAlphaNumericString(length: 6).uppercased()
        self.hexdecimalTextLabel.text = "#\(hexDecimalString)"
        UIView.animate(withDuration: 1.0) {
            let color = UIColor("#\(hexDecimalString)")
            self.hexBoxView.backgroundColor = color
            self.hexdecimalTextLabel.textColor = color
            self.hexBoxView.layer.borderColor = UIColor("#CCCCCC")?.cgColor
            self.hexBoxView.layer.borderWidth = 1.0
        }
    }
    
    private func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdef0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
}
