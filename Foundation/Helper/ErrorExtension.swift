//
//  ErrorExtension.swift
//  Demo
//
//  Created by Foryou on 2018/9/17.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import Foundation


let kErrorMessage = "ErrorMessage"

extension NSError{
    
    var msg : String?
    {
        get
        {
            if let text = self.userInfo[kErrorMessage] as? String
            {
                return text
            }
            
            return nil
        }
    }
    
    class func create(code:Int,message:String?) -> NSError
    {
        var userInfo : Dictionary<String, String>?
        
        if message != nil
        {
            userInfo = Dictionary<String, String>()
            userInfo![kErrorMessage] = message
        }
        
        return NSError(domain: "com.demo.error", code: code, userInfo: userInfo)
    }
}

extension Error{
    
    var msg : String?
    {
        get
        {
            if let err = self as? NSError
            {
                return err.msg
            }
        }
    }
    
    var code : Int
    {
        get{
            if let err = self as? NSError
            {
                return err.code
            }
        }
    }
}
