//
//  UIButton.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 20/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIButton {
    
    @IBInspectable public var underline:Bool {
        set {
            if newValue {
                let attrs = [
                    NSUnderlineStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue
                ]
                self.titleLabel?.attributedText = NSMutableAttributedString(string: self.titleLabel!.text!, attributes: attrs)
            }
        }
        get {
            let range = NSMakeRange(0, self.titleLabel!.text!.length)
            var underlined:Bool = false
            
            self.titleLabel?.attributedText?.enumerateAttributes(in: range, options: NSAttributedString.EnumerationOptions.longestEffectiveRangeNotRequired) { (attributes, range, stop) in
                if attributes[NSUnderlineStyleAttributeName] != nil {
                    underlined = Bool(attributes[NSUnderlineStyleAttributeName] as! NSNumber)
                }
            }
            return underlined
        }
    }
}
