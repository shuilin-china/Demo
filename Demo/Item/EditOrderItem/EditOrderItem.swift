//
//  EditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class EditOrderItem: NSObject {

    var info : EditOrderInfo?
    
    func load(callback:@escaping ResultCallback){
        
        if let temp = info as? NewEditOrderInfo{
            
            self .update()
        }
        else if let temp = info as? OldEditOrderInfo{
            //temp.oldInfo
            
            self .update()
        }
        else if let temp = info as? IDEditOrderInfo{
            //temp.ID
            
            self .update()
        }
        else{
            callback(nil)
        }
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
