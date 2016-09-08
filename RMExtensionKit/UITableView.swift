//
//  UITableView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/09/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func rowHeight(cellIdentifier:String) -> CGFloat {
        
        if let cell:UITableViewCell = self.dequeueReusableCellWithIdentifier(cellIdentifier) {
            return cell.frame.height
        }
        return self.rowHeight
    }
}