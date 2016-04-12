//
//  UIImage.swift
//  Mimo
//
//  Created by Rondinelli Morais on 15/02/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func normalizedImage() -> UIImage {
        
        if (self.imageOrientation == UIImageOrientation.Up) {
            return self;
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        self.drawInRect(rect)
        
        let normalizedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return normalizedImage;
    }
    
    public func resize(size:CGSize) -> UIImage {
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        UIGraphicsBeginImageContextWithOptions(size, true, scale)
        self.drawInRect(CGRect(origin: CGPointZero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
    
    public func save(path:String) -> Bool {
        let fileManager = NSFileManager()
        let data = UIImageJPEGRepresentation(self, UIScreen.mainScreen().scale)
        return fileManager.createFileAtPath(path, contents: data, attributes: nil)
    }
}
