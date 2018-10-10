//
//  Sequence+Filtering.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension Sequence where Iterator.Element: OptionalType{
    public func filteringNils() -> [Iterator.Element.Wrapped]{
        return filter{ return $0.optionalValue != nil } as! [Iterator.Element.Wrapped]
    }
}
