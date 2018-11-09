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

//存储一个页面的状态，以及参数传递
class EditOrderItemContext: NSObject, NSCopying {

    //装货时间
    var loadTimeStamp : NSInteger?
    
    //装货时间点击事件
    var loadTimeClickCommand : ProtocolCommand?
    
    //经停点信息
    var pointInfos : Array<EditOrderPointInfo> = Array()
    
    //经停点点击事件
    var pointClickCommand : ProtocolCommand?
    
    //时效要求开关
    var timeOn : Bool = false
    
    //拷贝
    func copy(with zone: NSZone? = nil) -> Any {
        
        let object = EditOrderItemContext()

        object.loadTimeStamp = self.loadTimeStamp
        object.loadTimeClickCommand = self.loadTimeClickCommand
        
        //...

        return object
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
