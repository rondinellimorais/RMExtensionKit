//
//  UIApplication.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 20/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public func call(_ phoneNumber:String, showPrompt:Bool? = true) {
        
        if showPrompt! {
            self.open(URL(string: "telprompt://\(phoneNumber)")!, options: [:], completionHandler: nil)
            return
        }
        self.open(URL(string: "tel://\(phoneNumber)")!, options: [:], completionHandler: nil)
    }
}
