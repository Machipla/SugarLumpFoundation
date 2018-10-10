//
//  Array+Safe.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension Array{
    
    mutating func safeAppend(_ newElement:Element?){
        if(newElement != nil){
            self.append(newElement!);
        }
    }
    
    mutating func safeRemove(at index:Int){
        if(self.isIndexContained(inRange: index)){
            self.remove(at:index);
        }
    }
    
    func safeObject(at index:Int?) -> Element? {
        guard (index != nil && self.isIndexContained(inRange:index!)) else{
            return nil;
        }
        return self[index!];
    }
    
    func safeSubarray(withRange range:Range<Int>) -> [Element]? {
        // Obtenemos el rango seguro
        let safeRange:Range<Int> = range.clamped(to: 0..<self.count);
        return Array(self[safeRange]);
    }
    
    func isIndexContained(inRange index: Int) -> Bool {
        if index >= 0 && index < self.count {
            return true
        }
        return false
    }
}

public extension Array{
    mutating func remove(where predicate:((Element) -> Bool)){
        guard let toRemoveIndex = index(where: predicate) else { return }
        remove(at: toRemoveIndex)
    }
}

public extension Array where Element: Equatable{
    mutating func removeDuplicates(){
        var result = [Element]()
        forEach({ if !result.contains($0) { result.append($0) } })
        self = result
    }
    
    func removingDuplicates() -> [Element]{
        var toRemoveArray = self
        toRemoveArray.removeDuplicates()
        return toRemoveArray
    }
    
    mutating func remove(element: Element){
        if let indexOfObject:Int = index(of: element){
            remove(at: indexOfObject)
        }
    }
    
    func removing(element:Element) -> [Element]{
        var toRemoveArray = self
        toRemoveArray.remove(element: element)
        return toRemoveArray
    }
}
