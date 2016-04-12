//
//  UIImageView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

@IBDesignable extension UIImageView {

    /**
     *  set corner radius
     */
    @IBInspectable public var cornerRadius:CGFloat  {
        get {
            return self.layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
}
