//
//  JSONDecodable.swift
//  Pods
//
//  Created by jmlucena on 16/5/17.
//
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

protocol JSONDecodable {
    init?(dictionary: JSONDictionary)
}

func decode<T: JSONDecodable>(dictionaries: [JSONDictionary]) -> [T] {
    return dictionaries.flatMap { T(dictionary: $0) }
}

func decode<T: JSONDecodable>(dictionary: JSONDictionary) -> T? {
    return T(dictionary: dictionary)
}

func decode<T:JSONDecodable>(data: Data) -> [T]? {
    guard let JSONObject = try? JSONSerialization.jsonObject(with: data, options: []),
        let dictionaries = JSONObject as? [JSONDictionary] else {
            return nil
    }
    
    let objects: [T] = decode(dictionaries: dictionaries)
    
    return objects
}
