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
}
