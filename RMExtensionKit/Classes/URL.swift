//
//  URL.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 12/05/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension URL {

  public func query(_ name:String) -> String? {

    let urlComponents = URLComponents(string: self.absoluteString)
    if let queryItems = urlComponents?.queryItems {
      if let param = queryItems.filter({$0.name == name}).first {
        return param.value
      }
    }
    return nil
  }
}
