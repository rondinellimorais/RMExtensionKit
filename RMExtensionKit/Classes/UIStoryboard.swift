//
//  UIStoryboard.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 27/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIStoryboard {

    public class func mainBoard(_ bundle:Bundle? = Bundle.main) -> UIStoryboard {
        let storyBoard:String = Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile") as! String
        return UIStoryboard(name:storyBoard, bundle:bundle)
    }
    
    public func board(_ storeBoardID:String) -> UIViewController? {
        return self.instantiateViewController(withIdentifier: storeBoardID)
    }
}
