//
//  Comparable+Operations.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension Comparable{
    mutating func clamp(from lowerBound: Self, to upperBound: Self){
        self = clamping(from: lowerBound, to: upperBound)
    }
    
    mutating func clamp(by range: ClosedRange<Self>){
        clamp(from: range.lowerBound, to: range.upperBound)
    }
    
    func clamping(from lowerBound: Self, to upperBound: Self) -> Self{
        return min(max(self, lowerBound), upperBound)
    }
    
    func clamping(by range: ClosedRange<Self>) -> Self{
        return clamping(from: range.lowerBound, to: range.upperBound)
    }
}
