//
//  UIDevice.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 20/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public func call(_ phoneNumber:String, showPrompt:Bool? = true) {
        
        if showPrompt! {
            self.openURL(URL(string: "telprompt://\(phoneNumber)")!)
            return
        }
        self.openURL(URL(string: "tel://\(phoneNumber)")!)
    }
}
