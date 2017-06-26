//
//  NSDate.swift
//  Mimo
//
//  Created by Rondinelli Morais on 05/02/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

/**
 *  `DateCompare` is a enum for compare dates
 *  `Later` It indicates that the current date is greater than the last time as a parameter
 *  `Equals` It indicates that the current date is equals than the last time as a parameter
 *  `Less` It indicates that the current date is less than the last time as a parameter
 *  `Undefine` When none of these options are met
 */
public enum DateCompare : Int {
    case undefined
    case later
    case equals
    case less
}

extension Date {
    
    // MARK: privates vars
    private static let associationMap = NSMapTable<NSString, AnyObject>()
    private struct Keys {
        static var Locale:NSString = "locale"
    }
    
    /* Returns true if the target date equals the current date */
    public var isToday:Bool {
        get {
            return Calendar.current.isDateInToday(self)
        }
    }

   /**
    *  Add seconds to date
    *
    *  @param second      Number of seconds to add
    *
    *  @discussion If the number of seconds is greater than 60, minutes will be affected
    *
    *  @return New `NSDate` modify
    */
    public func addSeconds(_ second:Int) -> Date {
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
    public func addMinutes(_ minutes:Int) -> Date {
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
    public func addHours(_ hours:Int) -> Date {
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
    public func addMonths(_ month:Int) -> Date {
        return addTime(year: 0, month:month, hour:0, minute:0, second:0)
    }
    
    /**
     *  Add year to date
     *
     *  @param year      Number of minutes to add
     *
     *  @return New `NSDate` modify
     */
    public func addYears(_ year:Int) -> Date {
        return addTime(year:year, month:0, hour:0, minute:0, second:0)
    }
    
    /**
     *
     */
    public func timeInterval() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    /**
     * 
     */
    public func toString(_ dateFormat: String) -> String {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateStringFormatter.string(from: self)
    }
    
    /**
     *  Compare two dates
     *
     *  @param anotherDate  date to compare
     *
     *  @return enum `NSDateCompare`
     */
    public func compareTo(_ anotherDate:Date) -> DateCompare {
        
        let comparation = self.compare(anotherDate)
        
        if comparation == ComparisonResult.orderedDescending {
            return DateCompare.later
        }
        else if comparation == ComparisonResult.orderedAscending {
            return DateCompare.less
        }
        else if comparation == ComparisonResult.orderedSame {
            return DateCompare.equals
        }
        return DateCompare.undefined
    }
    
    /**
     *  Return a list of months base on current month
     *
     *  @param numberOfMonth  Number of months, when negative number is specified, the list is descending
     *
     *  @return list of strings
     */
    public func months(_ numberOfMonth:Int) -> [String] {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let months = dateFormatter.standaloneMonthSymbols
        let calendar = Calendar.current
        let components:DateComponents = (calendar as NSCalendar).components([.month], from: self)
        let start = components.month
        var end = 0
        var returnMonths:[String] = []
        var currentMonth = components.month!
        
        // descending
        if numberOfMonth < 0 {
            end = (components.month! + (numberOfMonth + 1) )
            for _ in end ... start! {
                returnMonths.append( (months?[currentMonth - 1].uppercased())! )
                if currentMonth == 1 { currentMonth = 12 } else { currentMonth -= 1 }
            }
        }
        
        // ascending
        if numberOfMonth > 0 {
            end = (components.month! + (numberOfMonth - 1) )
            for _ in start! ... end {
                returnMonths.append( (months?[currentMonth - 1].uppercased())! )
                if currentMonth == 12 { currentMonth = 1 } else { currentMonth += 1 }
            }
        }
        
        // when is empty
        if returnMonths.isEmpty {
            returnMonths.append((months?[components.month!])!)
        }
        
        return returnMonths
    }
    
    /**
     * Return the differece in days beetween two dates
     * 
     * @param anotherDate target date to compare
     * 
     * @return The differece in days
     */
    public func differecesDay(_ anotherDate:Date) -> Int {

        let calendar: Calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: anotherDate)
        let components = (calendar as NSCalendar).components(NSCalendar.Unit.day, from: date1, to: date2, options: [])
        return components.day!
    }
    
    // ==================================================================
    // MARK: Initialize
    // ==================================================================
   /**
    *  Create `NSDate` base on time interval
    *
    *  @param timeInterval      The time interval valid
    *
    *  @return A `NSDate` valid
    */
    public init(timeInterval:Int64) {
        let date = Date(timeIntervalSince1970:TimeInterval(timeInterval/1000))
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
    public init(year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int){
        let date = Date.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
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
    public init(year:Int, month:Int, day:Int, hour:Int, minute:Int){
        let date = Date.createDate(year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
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
    public init(year:Int, month:Int, day:Int){
        let date = Date.createDate(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        self.init(timeIntervalSinceNow:date.timeIntervalSinceNow)

    }
    
    
    
    
    // MARK: Custom formatter
    
    /// locale
    public var locale:Locale? {
        get {
            
            if let storage = Date.associationMap.object(forKey: Keys.Locale) {
                return (storage as! RMEObject).object as? Locale
            }
            return nil
        }
        set {
            if newValue != nil {
                Date.associationMap.setObject(RMEObject(newValue!), forKey: Keys.Locale)
            }
        }
    }
    
    /// @return day of month
    public var day:Int {
        get {
            return Calendar.current.component(Calendar.Component.day, from: self)
        }
    }
    
    /// @return month of year
    public var month:Int {
        get {
            return Calendar.current.component(Calendar.Component.month, from: self)
        }
    }
    
    /// @return year of date
    public var year:Int {
        get {
            return Calendar.current.component(Calendar.Component.year, from: self)
        }
    }
    
    /// @return day of week
    public var weekDay:Int {
        get {
            return Calendar.current.component(Calendar.Component.weekday, from: self)
        }
    }
    
    /// @return day of week symbol
    public var weekDayString:String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = self.locale
            return dateFormatter.weekdaySymbols[self.weekDay - 1].capitalized
        }
    }
    
    /// @return month of year symbol
    public var monthString:String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = self.locale
            return dateFormatter.monthSymbols[self.month].capitalized
        }
    }
    
    
    

    // MARK: Private
    fileprivate func addTime(year:Int, month:Int, hour:Int, minute:Int, second:Int) -> Date {
        var components = DateComponents()
        
        components.year = year
        components.month = month
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return (Calendar.current as NSCalendar).date(byAdding: components, to: self, options: NSCalendar.Options(rawValue: 0))!
    }
    
    fileprivate static func createDate(year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        return Calendar.current.date(from: components)!
    }
}




