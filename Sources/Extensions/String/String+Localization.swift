//
//  String+Localization.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
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
