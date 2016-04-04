//
//  NSDate.swift
//  Mimo
//
//  Created by Rondinelli Morais on 05/02/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

extension NSDate {
    
    public func addSecond(second:Int) -> NSDate {
        return self.dateByAddingTime(0, minute: 0, second: second)
    }
    
    private func dateByAddingTime(hour:Int, minute:Int, second:Int) -> NSDate {
        let components = NSDateComponents()
        components.hour = hour
        components.minute = minute
        components.second = second
        return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }
    
    public func timeInterval() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    convenience init(timeInterval:Int64) {
        let date = NSDate(timeIntervalSince1970:NSTimeInterval(timeInterval/1000))
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)
    }
    
    public func toString(dateFormatter:String) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = dateFormatter
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return dateStringFormatter.stringFromDate(self)
    }
}