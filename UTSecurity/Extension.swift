//
//  Extension.swift
//  UTSecurity
//
//  Created by Sebarina Xu on 5/25/16.
//  Copyright © 2016 liufan. All rights reserved.
//

import Foundation
import CommonCrypto

public enum HMACAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    public func toCCHmacAlgorithm() -> CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:
            result = kCCHmacAlgMD5
        case .SHA1:
            result = kCCHmacAlgSHA1
        case .SHA224:
            result = kCCHmacAlgSHA224
        case .SHA256:
            result = kCCHmacAlgSHA256
        case .SHA384:
            result = kCCHmacAlgSHA384
        case .SHA512:
            result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    public func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

public extension String{
    
    public func md5()->String {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    
    public func hmac(algorithm: HMACAlgorithm, key: String) -> String {
        let cKey = key.cStringUsingEncoding(NSUTF8StringEncoding)
        let cData = self.cStringUsingEncoding(NSUTF8StringEncoding)
        var result = [CUnsignedChar](count: Int(algorithm.digestLength()), repeatedValue: 0)
        let length : Int = Int(strlen(cKey!))
        let data : Int = Int(strlen(cData!))
        CCHmac(algorithm.toCCHmacAlgorithm(), cKey!,length , cData!, data, &result)
        
        let hmacData:NSData = NSData(bytes: result, length: (Int(algorithm.digestLength())))
        
        var bytes = [UInt8](count: hmacData.length, repeatedValue: 0)
        hmacData.getBytes(&bytes, length: hmacData.length)
        
        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02hhx", UInt8(byte))
        }
        return hexString
    }
    
    
}