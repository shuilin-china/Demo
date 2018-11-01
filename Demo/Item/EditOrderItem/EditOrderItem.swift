//
//  EditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit


class EditOrderItem: NSObject {

    //外部不要访问
    var info : EditOrderInfo?
    
    func load(callback:@escaping ResultCallback){
        
        //子类重写
        
        callback(nil)
    }
    
    func submit(callback:@escaping ResultCallback){
        
        let request : SubmitOrderRequest = SubmitOrderRequest()
        
        //把info中的值赋给request
        //...
        
        request.send { (error) in
            
            callback(error)
        }
    }
    
    func update(){
        
        //根据info构建表项
        //...
    }
}
