//
//  Collection+ElementCheck.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension Collection{
    func allConforms(to check:((Element)->Bool)) -> Bool {
        for singleElement:Element in self{
            if(!check(singleElement)){
                return false;
            }
        }
    
        return true;
    }
    
    func anyConforms(to check:((Element) -> Bool)) -> Bool{
        return first(where: check) != nil
    }
}
