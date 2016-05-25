//
//  UTKeychainSecurity.swift
//  UTKeychainSecurity
//
//  Created by Sebarina Xu on 5/23/16.
//  Copyright © 2016 liufan. All rights reserved.
//

import Foundation

public class UTKeychainSecurity {
  
    var keychainWrapper : KeychainWrapper
    public init(group: String, service: String) {
        self.keychainWrapper = KeychainWrapper(accessGroup: group, serviceName: service)
    }
    
    public func securitySaveValue(value: String, key: String) -> Bool {
        return keychainWrapper.setString(value, forKey: key)
    }
    
    public func securitySaveData(data: NSData, key: String) -> Bool {
        return keychainWrapper.setData(data, forKey: key)
    }
    
    public func securityGetValueByKey(key: String) -> String? {
        return keychainWrapper.stringForKey(key)
    }
    
    public func securityGetDataByKey(key: String) -> NSData? {
        return keychainWrapper.dataForKey(key)
    }
    
    public func securityGetArrayByKey(key: String) -> NSArray? {
        return keychainWrapper.objectForKey(key) as? NSArray
    }
    
    public func securitySaveArray(array: NSArray, key: String) -> Bool {
        return keychainWrapper.setObject(array, forKey: key)
    }
    
    public func securityDeleteItemByKey(key: String) -> Bool {
        return keychainWrapper.removeObjectForKey(key)
    }
}