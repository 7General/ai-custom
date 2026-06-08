//
//  Dictionary+attribute.swift
//  BOPUtils
//
//  Created by zz on 8.10.23.
//

import Foundation

extension Dictionary where Key == String, Value: Any {
    public func convertToJSONString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            debugPrint("JSON 转换错误: \(error.localizedDescription)")
            return nil
        }
    }
}


// MARK:- 一、基本的扩展
public extension Dictionary  {
    
    // MARK: 1.1、检查字典里面是否有某个 key
    /// 检查字典里面是否有某个 key
    func has(_ key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    // MARK: 1.2、字典的key或者value组成的数组
    /// 字典的key或者value组成的数组
    /// - Parameter map: map
    /// - Returns: 数组
    func toArray<V>(_ map: (Key, Value) -> V) -> [V] {
        return self.map(map)
    }
    
    // MARK: 1.3、JSON字符串 -> 字典
    /// JsonString转为字典
    /// - Parameter json: JSON字符串
    /// - Returns: 字典
    static func jsonToDictionary(json: String) -> Dictionary<String, Any>? {
        if let data = (try? JSONSerialization.jsonObject(
            with: json.data(using: String.Encoding.utf8,
                            allowLossyConversion: true)!,
            options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary<String, Any> {
            return data
        } else {
            return nil
        }
    }
    
    // MARK: 1.4、字典 -> JSON字符串
    /// 字典转换为JSONString
    func _toJSON() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions()) {
            let jsonStr = String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            return String(jsonStr ?? "")
        }
        return nil
    }
    
    // MARK: 1.5、字典里面所有的 key
    /// 字典里面所有的key
    /// - Returns: key 数组
    func _allKeys() -> [Key] {
        /*
         shuffled：不会改变原数组，返回一个新的随机化的数组。  可以用于let 数组
         */
        return self.keys.shuffled()
    }
    
    // MARK: 1.6、字典里面所有的 value
    /// 字典里面所有的value
    /// - Returns: value 数组
    func allValues() -> [Value] {
        return self.values.shuffled()
    }
    
    ///  MARK: 1.7、用于字典的合并
    mutating func merge(dic:Dictionary) {
        self.merge(dic) { (parama1, parama2) -> Value in
            return parama1
        }
    }
    
    /// 使用新值（更常用）
    mutating func mergeNew(_ dict: Dictionary) {
        self.merge(dict) { _, new in new }
    }
    
    mutating func la_combine(_ dict: Dictionary) {
        var tem = self
        dict.forEach({ (key, value) in
            if let existValue = tem[key] {
                // combine same name query
                if let arrValue = existValue as? [Value] {
                    tem[key] = (arrValue + [value]) as? Value
                } else {
                    tem[key] = ([existValue, value]) as? Value
                }
            } else {
                tem[key] = value
            }
        })
        self = tem
    }
}

