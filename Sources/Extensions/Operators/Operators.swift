//
//  MCPOperators.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

// MARK: Nil operators
precedencegroup ifNotNilPrecedence {
    associativity: right
}

infix operator ?= : ifNotNilPrecedence
public func ?= <T: Any> ( left: inout T, right: T?) {
    if let right = right {
        left = right
    }
}
