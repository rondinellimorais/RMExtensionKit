//
//  UIView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 07/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit


extension UIView {
    
    fileprivate var nibIndex:Int {
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
    public func showBorder(_ borderWidth:CGFloat, borderColor:UIColor){
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    public func toImage() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.isOpaque, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func toImage(_ frame: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.clip(to: frame)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
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
    
    
    
    public func loadNibView(_ index:Int? = nil) {
        self.nibIndex = (index == nil ? 0 : index!)
        xibSetup()
    }
    
    fileprivate func xibSetup() {
        
        if let view = loadViewFromNib() {
            
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // Adding custom subview on top of our view (over any custom drawing > see note below)
            addSubview(view)
        }
    }
    
    fileprivate func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed("\(type(of: self))", owner: self, options: nil)?[self.nibIndex]  as! UIView
        return view
    }
}
