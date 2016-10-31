//
//  UIColor.swift
//  ConectaCenter
//
//  Created by Rondinelli Morais on 10/03/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(r: Float, g: Float, b: Float, a:Float) {
        assert(r >= 0.0 && r <= 255.0, "Invalid red component")
        assert(g >= 0.0 && g <= 255.0, "Invalid green component")
        assert(b >= 0.0 && b <= 255.0, "Invalid blue component")
        assert(a >= 0.0 && a <= 255.0, "Invalid alpha component")
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    public convenience init(r: Float, g: Float, b: Float) {
        self.init(r:r, g: g, b: b, a: 1.0)
    }
    
    public convenience init(hex:Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(r:Float(components.R), g: Float(components.G), b: Float(components.B), a: 1.0)
    }
    
    public class func random() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
    
    private class func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
