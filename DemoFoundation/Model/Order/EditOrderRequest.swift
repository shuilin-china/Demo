//
//  EditOrderRequest.swift
//  Demo
//
//  Created by Foryou on 2018/11/14.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit


class LoadEditOrderRequest: NSObject {

    func send(order : EditOrder, callback : @escaping ResultCallback) {
        
        //子类实现
        callback(nil)
    }
}


class NewEditOrderRequest: LoadEditOrderRequest {
    
    override func send(order : EditOrder, callback : @escaping ResultCallback) {
        
        //赋默认值
        order.points.removeAll()
        
        let point : EditOrderPoint = EditOrderPoint()
        order.points.append(point)
        
        let point2 : EditOrderPoint = EditOrderPoint()
        order.points.append(point2)
        
        //测试界面展示
        order.loadTimeStamp = 50000
        order.timeOn = true
        
        callback(nil)
    }
}


class OtherEditOrderRequest: LoadEditOrderRequest {
    
    var otherInfo : Any?
    
    override func send(order : EditOrder, callback : @escaping ResultCallback) {
        
        //把otherInfo值赋给order
        
        //...
        
        callback(nil)
    }
}

class IDEditOrderRequest: LoadEditOrderRequest {
    
    var ID : String?
    
    override func send(order : EditOrder, callback : @escaping ResultCallback) {
        
        //根据ID请求数据
        
        //把请求回来的数据赋值给order
        
        //...
        
        callback(nil)
    }
}


class SubmitEditOrderRequest: NSObject {
    
    func send(order : EditOrder, callback:@escaping ResultCallback){
        
        //根据order准备parameters
        //...
        
        callback(nil)
    }
    
}
