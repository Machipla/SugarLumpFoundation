//
//  File.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension String{
    subscript (substring range:Range<Int>) -> String?{
        return self[substring:range.lowerBound...range.upperBound]
    }
    
    subscript (substring range:ClosedRange<Int>) -> String?{
        let substringStartIndex = index(startIndex, offsetBy: range.lowerBound)
        let substringEndIndex = index(startIndex, offsetBy: range.upperBound)
        let substringRange = (substringStartIndex..<substringEndIndex).clamped(to: fullRange)
        
        guard !substringRange.isEmpty, fullRange.contains(substringRange.lowerBound) else { return nil }

        let substring = self[substringRange]
        return String(substring)
    }
    
    func truncated(length: Int, trailing:String = "...") -> String?{
        guard count > length else { return self }
        return self[substring: 0...length]?.appending(trailing)
    }
}
