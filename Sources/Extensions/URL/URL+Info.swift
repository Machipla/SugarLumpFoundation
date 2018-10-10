//
//  URL+Info.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension URL{
    
    var queryParams:Dictionary<String,String>?{
        guard query != nil else { return nil }
        
        var dictQueryParams:Dictionary<String,String> = Dictionary<String,String>()
        query?.components(separatedBy: "&").forEach({
            let paramKeyValue:[String] = $0.components(separatedBy: "=")
            if let paramKey = paramKeyValue.first?.removingPercentEncoding, let paramValue = paramKeyValue.last?.removingPercentEncoding{
                dictQueryParams.updateValue(paramValue, forKey: paramKey)
            }
        })
        return dictQueryParams
    }
}
