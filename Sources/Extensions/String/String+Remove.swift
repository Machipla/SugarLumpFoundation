//
//  String+Remove.swift
//  Pods
//
//  Created by Mario Chinchilla on 2/6/17.
//
//

import Foundation

public extension String{
    func removeCharacters(withPatterns options:StringPatternOptions) -> String{
        var resultantString:String = self
        
        if options.contains(.blankSpaces){
            resultantString = resultantString.removeCharactersIn(set: .whitespaces)
        }
        
        if options.contains(.consecutiveBlankSpaces){
            resultantString = resultantString.replacingOccurrences(of: "[ \\t]+", with: " ", options: .regularExpression, range: resultantString.startIndex..<resultantString.endIndex)
        }
        
        if options.contains(.startEndBlankSpaces){
            resultantString = resultantString.trimmingCharacters(in: .whitespaces)
        }
        
        if options.contains(.lineBreaks){
            resultantString = resultantString.removeCharactersIn(set: .newlines)
        }
        
        if options.contains(.emojis){
            resultantString.emojis.forEach({ resultantString = resultantString.replacingOccurrences(of: $0, with: "") })
        }
        
        if options.contains(.symbols){
            resultantString = resultantString.removeCharactersIn(set: .symbols)
            resultantString = resultantString.removeCharactersIn(set: .punctuationCharacters)
        }
        
        if options.contains(.numbers){
            resultantString = resultantString.replacingOccurrences(of: "[0-9]+", with: "", options: .regularExpression, range: resultantString.startIndex..<resultantString.endIndex)
        }
        
        if options.contains(.letters){
            resultantString = resultantString.removeCharactersIn(set: .letters)
        }
        
        return resultantString
    }
    
    func removeCharactersIn(set characterSet:CharacterSet) -> String{
        let filteredScalars:[UnicodeScalar] = self.unicodeScalars.filter({ return !characterSet.contains($0) })
        return String(String.UnicodeScalarView(filteredScalars))
    }
}
