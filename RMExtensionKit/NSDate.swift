//
//  NSDate.swift
//  Mimo
//
//  Created by Rondinelli Morais on 05/02/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

public enum NSDateCompare {
    case Undefined
    case Later
    case Equals
    case Less
}

extension NSDate {
    
    // MARK: Public
    public func addSeconds(second:Int) -> NSDate {
        return addTime(year: 0, month: 0, hour: 0, minute: 0, second: second)
    }
    
    public func addMinutes(minutes:Int) -> NSDate {
        return addTime(year: 0, month: 0, hour: 0, minute: minutes, second: 0)
    }
    
    public func addHours(hours:Int) -> NSDate {
        return addTime(year: 0, month:0, hour:hours, minute:0, second:0)
    }
    
    public func addMonths(month:Int) -> NSDate {
        return addTime(year: 0, month:month, hour:0, minute:0, second:0)
    }
    
    public func addYears(year:Int) -> NSDate {
        return addTime(year:year, month:0, hour:0, minute:0, second:0)
    }
    
    public func timeInterval() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    public func toString(dateFormatter:String) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = dateFormatter
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return dateStringFormatter.stringFromDate(self)
    }
    
    public func compareTo(anotherDate:NSDate) -> NSDateCompare {
        
        let comparation = self.compare(anotherDate)
        
        if comparation == NSComparisonResult.OrderedDescending {
            return NSDateCompare.Later
        }
        else if comparation == NSComparisonResult.OrderedAscending {
            return NSDateCompare.Less
        }
        else if comparation == NSComparisonResult.OrderedSame {
            return NSDateCompare.Equals
        }
        return NSDateCompare.Undefined
    }
    
    // MARK: Initialize
    public convenience init(timeInterval:Int64) {
        let date = NSDate(timeIntervalSince1970:NSTimeInterval(timeInterval/1000))
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)
    }
    
    public convenience init(year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int){
        let date = NSDate.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)
    }
    
    public convenience init(year:Int, month:Int, day:Int, hour:Int, minute:Int){
        let date = NSDate.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)

    }
    
    public convenience init(year:Int, month:Int, day:Int){
        let date = NSDate.createDate(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)

    }

    // MARK: Private
    private func addTime(year year:Int, month:Int, hour:Int, minute:Int, second:Int) -> NSDate {
        let components = NSDateComponents()
        
        components.year = year
        components.month = month
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }
    
    private class func createDate(year year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int) -> NSDate {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }
}




