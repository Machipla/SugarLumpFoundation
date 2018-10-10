//
//  String+Format.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension String{
    mutating func format(_ args:CVarArg...){
        self = String(format:self, arguments: args)
    }
    
    func formatted(_ args:CVarArg...) -> String{
        return String(format: self, arguments: args)
    }
}
