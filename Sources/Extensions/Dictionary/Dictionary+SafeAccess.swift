//
//  Dictionary+SafeAccess.swift
//  Pods
//
//  Created by Mario Chinchilla on 6/4/17.
//
//

import Foundation

public extension Dictionary{

    mutating func updateValueIfAny(_ value:Value?,forKey key:Key){
        guard value != nil else { return }
        updateValue(value!, forKey: key)
    }
    
    func containsValue(on key:Key) -> Bool{ // Syntactic sugar :D
        return self[key] != nil
    }
    
    subscript (string key:Key)  -> String?{
        if let returnedValue:Value  = self[key] {
            if(returnedValue is String){
                return returnedValue as? String;
            }else if(returnedValue is NSNumber){
                return String(format: "%ld", (returnedValue as? NSNumber)!.intValue);
            }
        }
        
        return nil;
    }
    
    func string(forKey key:Key) -> String?{
        return self[string: key]
    }
    
    subscript (array key:Key)  -> Array<Any>?{
        if let returnedValue = self[key], returnedValue is Array<Any>{
            return returnedValue as? Array;
        }
        
        return nil;
    }
    
    func array(forKey key:Key) -> Array<Any>?{
        return self[array: key]
    }

    subscript (dictionary key:Key) -> Dictionary?{
        if let returnedValue = self[key], returnedValue is Dictionary{
            return returnedValue as? Dictionary;
        }
        
        return nil;
    }
    
    func dictionary(forKey key:Key) -> Dictionary?{
        return self[dictionary: key]
    }
    
    subscript (int key:Key) -> Int{
        let returnedValue = self[key]
        if returnedValue is NSNumber{
            return (returnedValue as? NSNumber)!.intValue;
        }else if returnedValue is String{
            return Int((returnedValue as! String)) ?? 0
        }
        
        return 0;
    }
    
    func int(forKey key:Key) -> Int{
        return self[int: key]
    }
    
    subscript (float key:Key) -> Float{
        if let returnedValue = self[key], returnedValue is NSNumber{
            return (returnedValue as? NSNumber)!.floatValue;
        }
        
        return 0;
    }
    
    func float(forKey key:Key) -> Float{
        return self[float: key]
    }
    
    subscript (double key:Key) -> Double{
        if let returnedValue = self[key], returnedValue is NSNumber{
            return (returnedValue as? NSNumber)!.doubleValue;
        }
        
        return 0;
    }
    
    func double(forKey key:Key) -> Double{
        return self[double: key]
    }
    
    subscript (bool key:Key) -> Bool{
        if let returnedValue = self[key]{
            if(returnedValue is NSNumber){
                return (returnedValue as? NSNumber)!.boolValue;
            }else if(returnedValue is String){
                let returnedStringValue:String = (returnedValue as! String).lowercased();
                if(returnedStringValue == "true" || returnedStringValue == "1"){
                    return true;
                }
            }
        }
        
        return false;
    }
    
    func bool(forKey key:Key) -> Bool{
        return self[bool: key]
    }
    
}
