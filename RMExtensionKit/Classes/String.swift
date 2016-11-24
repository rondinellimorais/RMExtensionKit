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
    
    public func allowCharacters(_ characteres:String) -> String {
        let invertedSet = CharacterSet(charactersIn: characteres).inverted
        return self.components(separatedBy: invertedSet).joined(separator: String.empty)
    }
    
    public func trunc(_ length:Int) -> String {
        return NSString(string: self).substring( to: min(length, self.characters.count) )
    }
    
    public func toArray() -> [Character]? {
        var characters:[Character] = []
        for c in self.characters {
            characters.append(c)
        }
        return characters
    }
    
    public func substring(start:Int, end:Int) -> String {
        let chars = self.toArray()!
        let result:NSMutableString = NSMutableString()
        var endIndex = end
        if endIndex < 0 { endIndex = chars.count }
        
        for (i, c) in chars.enumerated() {
            if i >= start && i < endIndex {
                result.append(String(c))
            }
        }
        return result as String!
    }
    
    public func test(_ regex: String!) -> Bool {
        let expression = try! NSRegularExpression(pattern:regex, options: [.caseInsensitive])
        return expression.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, characters.count)) != nil
    }
    
    public func encodeURIComponent() -> String? {
        let characterSet = NSMutableCharacterSet.alphanumeric()
        characterSet.addCharacters(in: "-_.!~*'()")
        return self.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)
    }
    
    public func toHTML() -> NSAttributedString? {
        do {
            
            let attrStr = try NSAttributedString(
                data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            return attrStr
        } catch {}
        return nil
    }
    
    public func replace(_ pattern:String, newValue:String, options:NSRegularExpression.Options? = NSRegularExpression.Options.caseInsensitive) -> String? {
        let regex = try! NSRegularExpression(pattern: pattern, options: options!)
        let range = NSMakeRange(0, self.characters.count)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: newValue)
    }
    
    public func toDictionary() -> [AnyHashable: Any]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyHashable: Any]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
    // test: print( "08/10/1987 e rondinelli 22/04/2016 morais 1/4/2015".matchesForRegex("\\d{1,2}\\/\\d{1,2}\\/\\d{1,4}") )
    // options: Global, no-literal, case insensitive
    public func matchesForRegex(_ regex: String!, options:NSRegularExpression.Options? = NSRegularExpression.Options.caseInsensitive) -> [String] {
        let expression = try! NSRegularExpression(pattern: regex, options: options!)
        let results = expression.matches(in: self as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length))
        return results.map() {
            (self as NSString).substring(with: $0.range)
        }
    }
}
