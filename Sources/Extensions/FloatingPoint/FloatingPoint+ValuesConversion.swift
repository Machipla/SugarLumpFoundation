//
//  FloatingPoint+ValuesConversion.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
