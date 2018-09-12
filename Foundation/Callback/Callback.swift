//
//  Callback.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import Foundation

typealias ResultCallback = (Error?) -> Void

typealias DataResultCallback = (Any?, Error?) -> Void

func mainResultCallback(callback:@escaping ResultCallback,error:Error?)
{
    DispatchQueue.main.async {
        
        callback(error)
    }
}

func mainDataResultCallback(callback:@escaping DataResultCallback,data:Any?,error:Error?)
{
    DispatchQueue.main.async {
        
        callback(data,error)
    }
}
