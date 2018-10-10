//
//  MCPOperators.swift
//  Pods
//
//  Created by Mario Chinchilla on 21/5/17.
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
