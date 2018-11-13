//
//  EditOrder.swift
//  Demo
//
//  Created by Foryou on 2018/11/13.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//经停点
class EditOrderPoint : NSObject {
    
    var address : String = ""
    var name : String = ""
    var mobile : String = ""
}

class EditOrder: NSObject, NSCopying{

    //装货时间
    var loadTimeStamp : NSInteger = 0
    
    //经停点信息
    var points : Array<EditOrderPoint> = Array()
    
    //时效要求开关
    var timeOn : Bool = false
    
    //拷贝
    func copy(with zone: NSZone? = nil) -> Any {
        
        let object = EditOrder()
        
        object.loadTimeStamp = self.loadTimeStamp
        
        //...
        
        return object
    }
    
    func isLoadTimeEmpty() -> Bool
    {
        return self.loadTimeStamp == 0
    }
    
    func isPointEmpty(i : Int) -> Bool
    {
        let info : EditOrderPoint? = self .point(i:i)
        if info != nil && info!.name.count > 0 && info!.address.count > 0 && info!.mobile.count > 0
        {
            return false
        }
        
        return true
    }
    
    func point(i : Int) -> EditOrderPoint?
    {
        if i < self.points.count
        {
            return self.points[i]
        }
        
        return nil
    }
    
    func load(callback: @escaping ResultCallback)
    {
        //子类实现
        
        callback(nil)
    }
    
    func submit(callback:@escaping ResultCallback){
        
        let request : SubmitOrderRequest = SubmitOrderRequest()
        
        //把self中的值赋给request
        //...
        
        request.send { (error) in
            
            callback(error)
        }
    }
    
    
}
