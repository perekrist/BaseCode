//
//  LocalService.swift
//  BaseCode
//

import SwiftUI

class LocalService {
  
  static var shared: LocalService = {
    let instance = LocalService()
    return instance
  }()
  
  public func set(value: AnyObject, key: String) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  public func get<T: AnyObject>(key: String,
                                defaultValue: T,
                                completion: @escaping(T) -> Void) {
    let value = UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    completion(value)
  }
}
