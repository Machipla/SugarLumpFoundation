//
//  Bool+Additions.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension Bool {
    init<T: BinaryInteger>(_ num: T) {
        self.init(num != 0)
    }
}

