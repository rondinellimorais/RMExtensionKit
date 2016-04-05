//
//  NSDate.swift
//  Mimo
//
//  Created by Rondinelli Morais on 05/02/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

/**
 *  `NSDateCompare` is a enum for compare dates
 *  `Later` It indicates that the current date is greater than the last time as a parameter
 *  `Equals` It indicates that the current date is equals than the last time as a parameter
 *  `Less` It indicates that the current date is less than the last time as a parameter
 *  `Undefine` When none of these options are met
 */
public enum NSDateCompare : Int {
    case Undefined
    case Later
    case Equals
    case Less
}

extension NSDate {
    
    // MARK: Public
    
   /**
    *  Add seconds to date
    *
    *  @param second      Number of seconds to add
    *
    *  @discussion If the number of seconds is greater than 60, minutes will be affected
    *
    *  @return New `NSDate` modify
    */
    public func addSeconds(second:Int) -> NSDate {
        return addTime(year: 0, month: 0, hour: 0, minute: 0, second: second)
    }
    
    /**
     *  Add minutes to date
     *
     *  @param minutes      Number of minutes to add
     *
     *  @discussion If the number of minutes is greater than 60, hour will be affected
     *
     *  @return New `NSDate` modify
     */
    public func addMinutes(minutes:Int) -> NSDate {
        return addTime(year: 0, month: 0, hour: 0, minute: minutes, second: 0)
    }
    
    /**
     *  Add hours to date
     *
     *  @param hours      Number of hours to add
     *
     *  @discussion If the number of hour is greater then 24, day will be affected
     *
     *  @return New `NSDate` modify
     */
    public func addHours(hours:Int) -> NSDate {
        return addTime(year: 0, month:0, hour:hours, minute:0, second:0)
    }
    
    /**
     *  Add month to date
     *
     *  @param month      Number of month to add
     *
     *  @discussion If the number of month is greater then 12, year will be affected
     *
     *  @return New `NSDate` modify
     */
    public func addMonths(month:Int) -> NSDate {
        return addTime(year: 0, month:month, hour:0, minute:0, second:0)
    }
    
    /**
     *  Add year to date
     *
     *  @param year      Number of minutes to add
     *
     *  @return New `NSDate` modify
     */
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
    
    /**
     *  Compare two dates
     *
     *  @param anotherDate  date to compare
     *
     *  @return enum `NSDateCompare`
     */
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
    
   /**
    *  Create `NSDate` base on time interval
    *
    *  @param timeInterval      The time interval valid
    *
    *  @return A `NSDate` valid
    */
    public convenience init(timeInterval:Int64) {
        let date = NSDate(timeIntervalSince1970:NSTimeInterval(timeInterval/1000))
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)
    }
    
    /**
     *  Create `NSDate`
     *
     *  @param year     Year of the new date
     *  @param month    Month of the new date
     *  @param day      Day of the new date
     *  @param hour     Hour of the new date
     *  @param minute   Minute of the new date
     *  @param second   Second of the new date
     *
     *  @return A `NSDate` valid
     */
    public convenience init(year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int){
        let date = NSDate.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)
    }
    
    /**
     *  Create `NSDate`
     *
     *  @param year     Year of the new date
     *  @param month    Month of the new date
     *  @param day      Day of the new date
     *  @param hour     Hour of the new date
     *  @param minute   Minute of the new date
     *
     *  @return A `NSDate` valid
     */
    public convenience init(year:Int, month:Int, day:Int, hour:Int, minute:Int){
        let date = NSDate.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)

    }
    
    /**
     *  Create `NSDate`
     *
     *  @param year     Year of the new date
     *  @param month    Month of the new date
     *  @param day      Day of the new date
     *
     *  @return A `NSDate` valid
     */
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




