//
//  String+Localization.swift
//  Pods
//
//  Created by Mario Chinchilla on 27/3/17.
//
//

import Foundation

public extension String{
    
    static func localized(_ key:String) -> String{
        return NSLocalizedString(key, comment: "");
    }
    
    static func localized(_ key:String,_ params:CVarArg...) -> String{
        return String(format: self.localized(key),arguments: params);
    }
}
