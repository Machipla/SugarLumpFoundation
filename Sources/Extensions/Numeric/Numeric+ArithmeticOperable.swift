//
//  Numeric+ArithmeticOperable.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public protocol ArithmeticOperable{
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    init(_ v: Int)
}

extension Double : ArithmeticOperable{}
extension Float  : ArithmeticOperable{}
extension Int    : ArithmeticOperable{}
extension Int8   : ArithmeticOperable{}
extension Int16  : ArithmeticOperable{}
extension Int32  : ArithmeticOperable{}
extension Int64  : ArithmeticOperable{}
extension UInt   : ArithmeticOperable{}
extension UInt8  : ArithmeticOperable{}
extension UInt16 : ArithmeticOperable{}
extension UInt32 : ArithmeticOperable{}
extension UInt64 : ArithmeticOperable{}
