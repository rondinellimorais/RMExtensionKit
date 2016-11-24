//
//  UITableView.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/09/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func rowHeight(_ cellIdentifier:String) -> CGFloat {
        
        if let cell:UITableViewCell = self.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell.frame.height
        }
        return self.rowHeight
    }
}
