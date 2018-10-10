//
//  String+Info.swift
//  Pods
//
//  Created by Mario Chinchilla on 22/6/17.
//
//

import Foundation

public extension String{
    var fullRange:Range<String.Index>{ return startIndex..<endIndex }
}

public extension NSString{
    var fullRange:NSRange{ return NSRange(location:0, length:length) }
}
