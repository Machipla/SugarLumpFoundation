//
//  LayoutConstraint+Mutable.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension NSLayoutConstraint{
    
    /// Mutates the receiver multiplier by creating a new constraint with the new multiplier value.
    /// - Note: Layout may not be done automatically by this method
    ///
    /// - Parameter multiplier: New multiplier to apply to the constraint
    /// - Returns: The new constraint created at the modify of the multiplier
    @available(iOS 8.0, *)
    @discardableResult func changingMultiplier(_ multiplier:CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(item: firstItem as Any,
                                               attribute: firstAttribute,
                                               relatedBy: relation,
                                               toItem: secondItem,
                                               attribute: secondAttribute,
                                               multiplier: multiplier,
                                               constant: constant)
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = shouldBeArchived
        newConstraint.identifier = identifier
        
        NSLayoutConstraint.deactivate([self])
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

public extension Array where Element: NSLayoutConstraint{
    mutating func changeMultipliers(_ multiplier:CGFloat){
        for i in 0 ..< count{
            changeMultiplier(multiplier, at: i)
        }
    }
    
    mutating func changeMultiplier(_ multiplier:CGFloat, at index:Int){
        guard isIndexContained(inRange: index) else { return }
        let newConstraint:NSLayoutConstraint = self[index].changingMultiplier(multiplier)

        self[index] = newConstraint as! Element
    }
}
