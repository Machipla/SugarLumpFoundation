//
//  String+Parsing.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension String {
    
    @available(*, deprecated, message: "Use search(_ options:) instead")
    func unsensitiveSearch(forString searchString:String) -> Bool{
        return self.range(of: searchString, options: NSString.CompareOptions.caseInsensitive) != nil;
    }
    
    func search(_ string:String,options:String.CompareOptions = .literal) -> Bool{
        return range(of: string, options: options, range: fullRange, locale: nil) != nil
    }
}

