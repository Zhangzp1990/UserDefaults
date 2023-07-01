//
//  UserDefaultsConfig.swift
//  CreativeKit
//
//  Created by zhangzp on 2022/6/25.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: DefaultKey<T>
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        let transfromKey = key + (Bundle.main.bundleIdentifier ?? "")
        self.key = DefaultKey<T>(transfromKey)
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return Defaults.shared[key] ?? defaultValue
        }
        set {
            Defaults.shared[key] = newValue
        }
    }
}
