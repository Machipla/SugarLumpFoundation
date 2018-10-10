//
//  Array+Info.swift
//  Pods
//
//  Created by Mario Chinchilla on 14/5/17.
//
//

import Foundation

public extension Array{
    var fullRange:ClosedRange<Int>{
        guard !isEmpty else { return 0...0 }
        return 0...self.count-1
    }
    
    func firstOfType<ElementType>() -> ElementType?{
        return first(where: { $0 is ElementType }) as? ElementType
    }
}

public extension Array where Element: Equatable{
    func element(before element:Element) -> Element?{
        guard let previousIndex = index(of:element) else { return nil }
        return self[safe: previousIndex-1]
    }
    
    func element(after element:Element) -> Element?{
        guard let previousIndex = index(of:element) else { return nil }
        return self[safe: previousIndex+1]
    }
    
    func rangeBetween(element1:Element, element2:Element) -> ClosedRange<Int>?{
        guard let fromIndex = index(of: element1), let toIndex = index(of: element2) else { return nil }
        return fromIndex...toIndex
    }
    
    func subarrayBetween(element1:Element, element2:Element) -> [Element]{
        guard let rangeBetweenObjects:ClosedRange<Int> = rangeBetween(element1:element1,element2:element2) else { return [] }
        return Array(self[rangeBetweenObjects])
    }
}
