//
//  String+Info.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension String{
    var fullRange:Range<String.Index>{ return startIndex..<endIndex }
}

public extension NSString{
    var fullRange:NSRange{ return NSRange(location:0, length:length) }
}
