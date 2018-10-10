//
//  Dictionary+Filtering.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension Dictionary where Value: OptionalType{
    func filteringNilValues() -> [Key:Value.Wrapped]{
        var filteredCopy = [Key:Value.Wrapped]()
        for (key, value) in self {
            guard let nonNilValue = value.optionalValue else { continue }
            filteredCopy[key] = nonNilValue
        }
        
        return filteredCopy
    }
}
