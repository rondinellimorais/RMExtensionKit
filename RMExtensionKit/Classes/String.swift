//
//  String.swift
//  Mimo
//
//  Created by Rondinelli Morais on 11/12/15.
//  Copyright © 2015 Rondinelli Morais. All rights reserved.
//

import UIKit

extension String {
    
    public static var empty:String { get { return "" }}
    public var length:Int { get { return self.characters.count }}
    
    public func allowCharacters(characteres:String) -> String {
        let invertedSet = NSCharacterSet(charactersInString: characteres).invertedSet
        return self.componentsSeparatedByCharactersInSet(invertedSet).joinWithSeparator(String.empty)
    }
    
    public func trunc(length:Int) -> String {
        return NSString(string: self).substringToIndex( min(length, self.characters.count) )
    }
    
    public func toArray() -> [Character]? {
        var characters:[Character] = []
        for c in self.characters {
            characters.append(c)
        }
        return characters
    }
    
    public func substring(start start:Int, end:Int) -> String {
        let chars = self.toArray()!
        let result:NSMutableString = NSMutableString()
        var endIndex = end
        if endIndex < 0 { endIndex = chars.count }
        
        for (i, c) in chars.enumerate() {
            if i >= start && i < endIndex {
                result.appendString(String(c))
            }
        }
        return result as String!
    }
    
    public func test(regex: String!) -> Bool {
        let expression = try! NSRegularExpression(pattern:regex, options: [.CaseInsensitive])
        return expression.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, characters.count)) != nil
    }
    
    public func encodeURIComponent() -> String? {
        let characterSet = NSMutableCharacterSet.alphanumericCharacterSet()
        characterSet.addCharactersInString("-_.!~*'()")
        return self.stringByAddingPercentEncodingWithAllowedCharacters(characterSet)
    }
    
    public func toHTML() -> NSAttributedString? {
        do {
            
            let attrStr = try NSAttributedString(
                data: self.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            return attrStr
        } catch {}
        return nil
    }
    
    public func replace(pattern:String, newValue:String, options:NSRegularExpressionOptions? = NSRegularExpressionOptions.CaseInsensitive) -> String? {
        let regex = try! NSRegularExpression(pattern: pattern, options: options!)
        let range = NSMakeRange(0, self.characters.count)
        return regex.stringByReplacingMatchesInString(self, options: [], range: range, withTemplate: newValue)
    }
    
    public func toDictionary() -> [NSObject : AnyObject]? {
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [NSObject:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
    // test: print( "08/10/1987 e rondinelli 22/04/2016 morais 1/4/2015".matchesForRegex("\\d{1,2}\\/\\d{1,2}\\/\\d{1,4}") )
    // options: Global, no-literal, case insensitive
    public func matchesForRegex(regex: String!, options:NSRegularExpressionOptions? = NSRegularExpressionOptions.CaseInsensitive) -> [String] {
        let expression = try! NSRegularExpression(pattern: regex, options: options!)
        let results = expression.matchesInString(self as String, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length))
        return results.map() {
            (self as NSString).substringWithRange($0.range)
        }
    }
}
