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
        assert(a >= 0.0 && a <= 1.0, "Invalid alpha component")
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a))
    }
    
    public convenience init(r: Float, g: Float, b: Float) {
        self.init(r:r, g:g, b:b, a: 1.0)
    }
    
    public class func random(alpha:CGFloat? = nil) -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: (alpha ?? randomCGFloat())  )
    }
    
    /* 
        create color base on hexdecimal string
        UIColor("#00ADEE")
        UIColor("#8BC53F")
        UIColor("#AB2784")
        UIColor("#6F3D23")
     */
    
    public convenience init?(_ hex:String) {
        
        var hexValue:  UInt32 = 0
        
        // remove #
        let invertedSet = CharacterSet(charactersIn: "#")
        let cleanerHexString = hex.components(separatedBy: invertedSet).joined(separator: "")
        
        guard Scanner(string: cleanerHexString).scanHexInt32(&hexValue) else {
            assertionFailure("hex decimal color \(hex) is invalid!")
            return nil
        }
        
        self.init(hex: Int(hexValue))
    }
    
    // MARK: Private methods
    private class func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    private convenience init(hex:Int) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
