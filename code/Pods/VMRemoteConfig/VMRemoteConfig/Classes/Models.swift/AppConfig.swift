//
//  AppConfig.swift
//  Pods
//
//  Created by jmlucena on 16/5/17.
//
//

import Foundation

public struct AppConfig {
    public let version: String
    public let force: Bool
    public let url: URL?
    
    public var isNewerVersionAvailable: Bool {
        
        guard let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return false
        }
        
        print("Current version: \(currentVersion) \nRemote version: \(version)")
        return version.compare(currentVersion, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
    }
}

extension AppConfig: JSONDecodable {
    
    init?(dictionary: JSONDictionary) {
        
        let dictionary = dictionary as NSDictionary
        
        guard let version = dictionary.value(forKeyPath: "iOS.version") as? String,
            let force = dictionary.value(forKeyPath: "iOS.force") as? Bool,
            let URLString = dictionary.value(forKeyPath: "iOS.url") as? String else {
                return nil
        }
        
        self.version = version
        self.force = force
        self.url = URL(string: URLString)
    }
}
