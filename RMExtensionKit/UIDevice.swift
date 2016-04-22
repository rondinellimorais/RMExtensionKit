//
//  UIDevice.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 20/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public func call(phoneNumber:String, showPrompt:Bool? = true) {
        
        if showPrompt! {
            self.openURL(NSURL(string: "telprompt://\(phoneNumber)")!)
            return
        }
        self.openURL(NSURL(string: "tel://\(phoneNumber)")!)
    }
}
