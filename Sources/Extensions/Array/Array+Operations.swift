//
//  Array+Operations.swift
//  Pods
//
//  Created by Mario Chinchilla on 7/7/17.
//
//

import Foundation

public extension Array where Element: Equatable{
    mutating func remove(subarray: [Element]){
        forEach({
            if subarray.contains($0), let indexToRemove:Int = index(of: $0){
                remove(at: indexToRemove)
            }
        })
    }
    
    mutating func moveToLast(object:Element){
        guard let index = index(of: object) else { return }
        moveToLast(from: index)
    }
    
    public mutating func merge(_ other:[Element]){
        let filteredSequence = other.filter{ return !self.contains($0) }
        append(contentsOf: filteredSequence)
    }
    
    public func merging(_ other:[Element]) -> [Element]{
        var filteredSequence = self
        filteredSequence.merge(other)
        return filteredSequence
    }
    
    public mutating func replace(_ element:Element, with otherElement:Element){
        guard let elementIndex = index(of: element) else { return }
        self[elementIndex] = otherElement
    }
    
    public func replacing(_ element:Element, with otherElement:Element) -> [Element]{
        var replacingArray = self
        replacingArray.replace(element, with: otherElement)
        return replacingArray
    }
    
    public mutating func remove(_ element:Element){
        guard let index = index(of: element) else { return }
        remove(at: index)
    }
    
    public func removing(_ element:Element) -> [Element]{
        var removingArray = self
        removingArray.remove(element)
        return removingArray
    }
    
    public mutating func substract(_ other:[Element]){
        self = filter{ return !other.contains($0) }
    }
    
    public func substracting(_ other:[Element]) -> [Element]{
        var substractingArray = self
        substractingArray.substract(other)
        return substractingArray
    }
}

public extension Array{
    mutating func moveToLast(from index:Int){
        guard let elementToMove = self[safe: index] else { return }
        remove(at: index)
        safeAppend(elementToMove)
    }
}

