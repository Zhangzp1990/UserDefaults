# UserDefaults

**基于UserDefaults封装的简单易用的轻量级存储，使用@propertyWrapper语法糖，代码更加简洁，使用更加方便**


# 使用方法

### 使用`@UserDefault`关键字包装要定义的变量，同时提供key和默认值。
```
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

```
