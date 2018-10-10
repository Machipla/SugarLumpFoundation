//
//  Sequence+Filtering.swift
//  GuudjobKit
//
//  Created by Mario Chinchilla on 22/11/17.
//

import Foundation

public extension Sequence where Iterator.Element: OptionalType{
    public func filteringNils() -> [Iterator.Element.Wrapped]{
        return filter{ return $0.optionalValue != nil } as! [Iterator.Element.Wrapped]
    }
}
