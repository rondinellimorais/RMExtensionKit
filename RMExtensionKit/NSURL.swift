//
//  NSURL.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 12/05/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension NSURL {

    public func query(name:String) -> String? {
        
        let urlComponents = NSURLComponents(string: self.absoluteString)
        if let queryItems = urlComponents?.queryItems {
            if let param = queryItems.filter({$0.name == name}).first {
                return param.value
            }
        }
        return nil
    }
}
