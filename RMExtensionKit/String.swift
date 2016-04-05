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
    
    public func allowCharacters(characteres:String) -> String {
        let invertedSet = NSCharacterSet(charactersInString: characteres).invertedSet
        return self.componentsSeparatedByCharactersInSet(invertedSet).joinWithSeparator(String.empty)
    }
}
