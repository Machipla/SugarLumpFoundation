//
//  Optional+TypeProtocol.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    var optionalValue: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optionalValue: Wrapped? { return self }
}
