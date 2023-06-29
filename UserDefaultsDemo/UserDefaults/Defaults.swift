//
//  Defaults.swift
//  CreativeKit
//
//  Created by zhangzp on 2022/6/25.
//

import Foundation

public class DefaultKey<T: Codable> {
    public let key: String
    
    public init(_ key: String) {
        self.key = key
    }
}

public class Defaults{
    public static let shared = Defaults()
    
    private let userDefaults: UserDefaults
    
    public init(_ userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    public func set<T>(_ value: T?, for key: DefaultKey<T>) {
        if isBasicType(T.self) {
            userDefaults.set(value, forKey: key.key)
        } else {
            guard let encoded = try? JSONEncoder().encode(value) else {
                return
            }
            userDefaults.set(encoded, forKey: key.key)
        }
    }
    
    public func get<T>(for key: DefaultKey<T>) -> T? {
        if isBasicType(T.self) {
            return userDefaults.value(forKey: key.key) as? T
        } else {
            guard let data = userDefaults.data(forKey: key.key),
                let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return decoded
        }
    }
    
    public func remove(for key: String) {
        userDefaults.removeObject(forKey: key)
        synchronize()
    }
    
    public func removeAll(_ bundle: Bundle = Bundle.main) {
        for key in userDefaults.dictionaryRepresentation() {
            userDefaults.removeObject(forKey: key.key)
        }
        synchronize()
    }
    
    public func synchronize() {
        userDefaults.synchronize()
    }
}

extension Defaults {
    private func isBasicType<T>(_ type: T.Type) -> Bool {
        return type is Int.Type
        || type is Float.Type
        || type is Double.Type
        || type is String.Type
        || type is Bool.Type
        || type is Date.Type
        || type is URL.Type
    }
}

extension Defaults {
    /// 支持下标访问
    subscript<T>(key: DefaultKey<T>) -> T? {
        get {
            return get(for: key)
        }
        
        set {
            set(newValue, for: key)
        }
    }
}
