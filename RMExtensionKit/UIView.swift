//
//  UIView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 07/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit


extension UIView {
    
    private var nibIndex:Int {
        set {
            self.tag = newValue
        }
        get {
            return self.tag
        }
    }
    
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

    /**
     * Exemple:
     * ----------------------------------
    
        class CustomerView : UIView {
     
            // MARK: Override
            override init(frame: CGRect) {
                super.init(frame: frame)
                loadNibView()
            }
            
            required init(coder aDecoder: NSCoder) {
                super.init(coder: aDecoder)!
                loadNibView()
            }
        }
    */
    
    
    
    public func loadNibView(index:Int? = nil) {
        self.nibIndex = (index == nil ? 0 : index!)
        xibSetup()
    }
    
    private func xibSetup() {
        
        if let view = loadViewFromNib() {
            
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            
            // Adding custom subview on top of our view (over any custom drawing > see note below)
            addSubview(view)
        }
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = NSBundle(forClass: self.dynamicType)
        let view = bundle.loadNibNamed("\(self.dynamicType)", owner: self, options: nil)[self.nibIndex]  as! UIView
        return view
    }
}
