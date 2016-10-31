//
//  UIStoryboard.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 27/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIStoryboard {

    public class func mainBoard(bundle:NSBundle? = NSBundle.mainBundle()) -> UIStoryboard {
        let storyBoard:String = NSBundle.mainBundle().objectForInfoDictionaryKey("UIMainStoryboardFile") as! String
        return UIStoryboard(name:storyBoard, bundle:bundle)
    }
    
    public func board(storeBoardID:String) -> UIViewController? {
        return self.instantiateViewControllerWithIdentifier(storeBoardID)
    }
}
