//
//  UIView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 07/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     *  show border
     *
     *  @param borderWidth
     *  @param borderColor
     *
     */
    public func showBorder(borderWidth:CGFloat, borderColor:UIColor){
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWidth
    }
    
    public func toImage() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.opaque, UIScreen.mainScreen().scale)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func toImage(frame: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.mainScreen().scale)
        CGContextClipToRect(UIGraphicsGetCurrentContext(), frame)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
