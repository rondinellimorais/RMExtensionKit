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
}
