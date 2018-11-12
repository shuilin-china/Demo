//
//  EditOrderItemContext.swift
//  Demo
//
//  Created by Foryou on 2018/11/9.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//经停点
class EditOrderPointInfo : NSObject {
    
    var address : String = ""
    var name : String = ""
    var mobile : String = ""
}

//存储一个页面的状态以传递这些状态
class EditOrderItemContext: NSObject, NSCopying {

    //装货时间
    var loadTimeStamp : NSInteger = 0
    
    //经停点信息
    var pointInfos : Array<EditOrderPointInfo> = Array()
    
    //时效要求开关
    var timeOn : Bool = false
    
    //拷贝
    func copy(with zone: NSZone? = nil) -> Any {
        
        let object = EditOrderItemContext()

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
        let info : EditOrderPointInfo? = self .pointInfo(i:i)
        if info != nil && info!.name.count > 0 && info!.address.count > 0 && info!.mobile.count > 0
        {
            return false
        }
        
        return true
    }
    
    func pointInfo(i : Int) -> EditOrderPointInfo?
    {
        if i < self.pointInfos.count
        {
            return self.pointInfos[i]
        }
        
        return nil
    }
}
