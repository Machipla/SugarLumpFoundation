//
//  Bool+Additions.swift
//  Eureka
//
//  Created by Mario Chinchilla on 29/5/18.
//

import Foundation

public extension Bool {
    init<T: BinaryInteger>(_ num: T) {
        self.init(num != 0)
    }
}

