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
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var attributes: [FileAttributeKey: Any]
        do {
            attributes = try FileManager.default.attributesOfFileSystem(forPath: documentDirectoryPath.last! as String)
            let freeSize = attributes[FileAttributeKey.systemFreeSize] as? NSNumber
            if (freeSize != nil) {
                return freeSize?.int64Value
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
