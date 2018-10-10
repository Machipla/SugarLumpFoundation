//
//  FloatingPoint+ValuesConversion.swift
//  Pods
//
//  Created by Mario Chinchilla on 2/8/17.
//
//

import Foundation

public extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
