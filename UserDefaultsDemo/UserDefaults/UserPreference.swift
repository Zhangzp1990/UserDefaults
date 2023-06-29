//
//  UserPreference.swift
//  CreativeKit
//
//  Created by zhangzp on 2022/6/25.
//

import Foundation

struct TestModel: Codable {
    var intValue: Int = 0
    var strValue: String = "a"
}

struct UserPreference {
    @UserDefault("intValue", defaultValue: 0)
    static var intValue: Int
    
    @UserDefault("arrayValue", defaultValue: [])
    static var arrayValue: [String]
    
    @UserDefault("URLValue", defaultValue: nil)
    static var URLValue: URL?

    @UserDefault("dictValue", defaultValue: [:])
    static var dictValue: [String : String]

    @UserDefault("TestModel", defaultValue: nil)
    static var test: TestModel?
}
