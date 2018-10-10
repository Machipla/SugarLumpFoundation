//
//  NSBundle+Additions.swift
//  SugarLumpFoundation
//
//  Created by Mario Chinchilla on 10/10/18.
//  
//

import Foundation

public extension Bundle{
    
    public enum InfoKeys: String{
        /// The "decorated" name of the bundle
        case displayName    = "CFBundleDisplayName"
        /// Displays the release version of the bundle such as "5.26.0" with a major, minor and patch numbers
        case releaseVersion = "CFBundleShortVersionString"
        /// Displays the build of the bundle
        case bundleVersion  = "CFBundleVersion"
    }
    
    public var displayName:String?{
        return infoDictionary?[string: InfoKeys.displayName.rawValue]
    }
    
    public var releaseVersion:String?{
        return infoDictionary?[string: InfoKeys.releaseVersion.rawValue]
    }
    
    public var buildVersion:String?{
        return infoDictionary?[string: InfoKeys.bundleVersion.rawValue]
    }
}
