//
//  UIDevice.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/06/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UIDevice {

    public func deviceRemainingFreeSpaceInBytes() -> Int64? {
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var attributes: [String: AnyObject]
        do {
            attributes = try NSFileManager.defaultManager().attributesOfFileSystemForPath(documentDirectoryPath.last! as String)
            let freeSize = attributes[NSFileSystemFreeSize] as? NSNumber
            if (freeSize != nil) {
                return freeSize?.longLongValue
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
