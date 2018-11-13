//
//  SubEditOrder.swift
//  Demo
//
//  Created by Foryou on 2018/11/13.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class NewEditOrder: EditOrder {

    override func load(callback: @escaping ResultCallback) {
        
        //赋默认值
        self.points.removeAll()
        
        let order : EditOrderPoint = EditOrderPoint()
        self.points.append(order)
        
        let order2 : EditOrderPoint = EditOrderPoint()
        self.points.append(order2)
        
        //测试界面展示
        self.loadTimeStamp = 50000
        self.timeOn = true
        
        callback(nil)
    }
}


class OldEditOrder: EditOrder {
    
    var info : Any?
    
    override func load(callback: @escaping ResultCallback) {
        
        //把info值赋给self
        
        //...
        
        callback(nil)
    }
}


class IDEditOrder: EditOrder {
    
    var ID : String?
    
    override func load(callback: @escaping ResultCallback) {
        
        //根据ID请求数据
        
        //把请求回来的数据赋值给self
        
        //...
       
        callback(nil)
    }
    
}

