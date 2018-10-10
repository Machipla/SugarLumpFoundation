//
//  Collection+Additions.swift
//  SugarLumpFoundation
//
//  Created by Mario Plaza on 19/7/18.
//

import Foundation

public extension Collection{
    public func forIndexedEach(_ body: (Element, Int) throws -> Void) rethrows{
        for (index,element) in enumerated(){
            try body(element,index)
        }
    }
}
