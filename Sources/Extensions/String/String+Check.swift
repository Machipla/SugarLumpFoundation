//
//  String+Checks.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public struct StringPatternOptions: OptionSet{
    public let rawValue: Int
    public init(rawValue:Int){ self.rawValue = rawValue } 
    
    public static let blankSpaces            = StringPatternOptions(rawValue: 1)
    public static let consecutiveBlankSpaces = StringPatternOptions(rawValue: 2) // "  "
    public static let startEndBlankSpaces    = StringPatternOptions(rawValue: 4)
    public static let lineBreaks             = StringPatternOptions(rawValue: 8)
    public static let emojis                 = StringPatternOptions(rawValue: 16)
    public static let symbols                = StringPatternOptions(rawValue: 32) // Símbolos contenidos en NSCharacterSet symbolsCharacterSet y punctuationCharacterSet
    public static let numbers                = StringPatternOptions(rawValue: 64)
    public static let letters                = StringPatternOptions(rawValue: 128) // De A...Z y a...z
    public static let inusualBlankSpaces:StringPatternOptions   = [.consecutiveBlankSpaces, .startEndBlankSpaces]
    public static let all:StringPatternOptions                  = [.blankSpaces, .consecutiveBlankSpaces, .startEndBlankSpaces, .lineBreaks, .emojis, .symbols, .numbers, .letters]
}

public extension String{
    
    var isEmail:Bool{
        let emailRegex:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex);
        return emailTest.evaluate(with: self);
    }
    
    var isPhoneNumber:Bool{
        do{
            let detector:NSDataDetector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches:[NSTextCheckingResult] = detector.matches(in: self, options: [], range: NSMakeRange(0, count));
            let firstResult:NSTextCheckingResult? = matches.first;
            if(firstResult != nil){
                let resultFromSameRange = firstResult!.range.location == 0 && firstResult!.range.length == count;
                return firstResult!.resultType == .phoneNumber && resultFromSameRange;
            }else{
                return false
            }
        }catch{
            debugPrint("Some error ocurred while building the phone detector... ",error);
            return false;
        }
    }
    
    var isURL:Bool{
        return URL(string: self) != nil
    }
    
    var isTwitterHandle:Bool{
        let twitterFormat = "@[A-Za-z0-9_]{1,15}";
        let twitterTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", twitterFormat);
        return twitterTest.evaluate(with: self);
    }
    
    func contains(patterns:StringPatternOptions) -> Bool{
        if patterns.contains(.blankSpaces) && !(self.rangeOfCharacter(from: .whitespaces)?.isEmpty ?? true){
            return true
        }
        if patterns.contains(.symbols) && (!(self.rangeOfCharacter(from: .symbols)?.isEmpty ?? true) || !(self.rangeOfCharacter(from: .punctuationCharacters)?.isEmpty ?? true)){
            return true
        }
        if patterns.contains(.lineBreaks) && !(self.rangeOfCharacter(from: .newlines)?.isEmpty ?? true){
            return true
        }
        if patterns.contains(.emojis) && self.containsEmoji{
            return true
        }
        if patterns.contains(.numbers) && !(self.rangeOfCharacter(from: CharacterSet(charactersIn:"0123456789"))?.isEmpty ?? true){
            return true
        }
        if patterns.contains(.letters) && !(self.rangeOfCharacter(from: .letters)?.isEmpty ?? true){
            return true
        }
        if patterns.contains(.startEndBlankSpaces) && (self.hasPrefix(" ") || self.hasSuffix(" ")){
            return true
        }
        if patterns.contains(.consecutiveBlankSpaces){
            let range:Range? = self.range(of: "[ \\t]+", options: .regularExpression)
            if range != nil, !range!.isEmpty{
                return true
            }
        }

        return false
    }
    
    func containsSomeCharacter(from set:CharacterSet) -> Bool{
        return rangeOfCharacter(from: set) != nil
    }
    
}
