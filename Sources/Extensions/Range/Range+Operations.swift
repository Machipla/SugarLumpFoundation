//
//  Range+Operations.swift
//  Pods
//
//  Created by Mario Chinchilla on 19/7/17.
//
//

import Foundation

public extension Range where Bound: ArithmeticOperable{
    func percentage(value:Bound) -> Bound{
        var percentage:Bound = Bound(0)
        let valuePercentage = value - lowerBound
        let boundsPercentage = upperBound - lowerBound
        if boundsPercentage != Bound(0){
            percentage = valuePercentage/boundsPercentage
        }

        percentage.clamp(from: Bound(0), to: Bound(1))
        return percentage
    }
}
