//
//  EditOrderCellItem.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class EditOrderCellItem: NSObject {

    var height : CGFloat = 30
    var hidden : Bool = false
    
    func update()
    {
        
    }
}

class EditOrderTitleValueCellItem: EditOrderCellItem {
    var title : String?
    var content : String?
    var contentColor : UIColor?
    
    var clickCommand : ProtocolCommand?
}


class EditOrderTimeCellItem : EditOrderTitleValueCellItem {

    var order : EditOrder?
    
    override func update()
    {
        self.title = "装货时间";
        
        if let order = self.order
        {
            if order.isLoadTimeEmpty()
            {
                self.content = "请选择"
                self.contentColor = UIColor.lightGray
            }
            else
            {
                self.content = String(format: "[%ld]", order.loadTimeStamp)
                self.contentColor = UIColor.gray
            }
            
            self.height = 50
        }
    
    }
    
    func setTime(day : String, hour : String)
    {
        //self.timeStamp = date?.timeIntervalSince1970
        
        let timeStamp = 60000
        self.order?.loadTimeStamp = timeStamp
        
        self.update()
    }
}


//经停点
class EditOrderPointCellItem : EditOrderCellItem {
    
    var text : NSAttributedString?
    var index : Int = -1
    
    var clickCommand : ProtocolCommand?
    
    var order : EditOrder?
    
    override func update()
    {
        //创建富文本text
        if let order = self.order
        {
            if order.isPointEmpty(i: self.index)
            {
                
            }
            else
            {
                let point = order.point(i: self.index)
            }
            
            self.height = 80
        }
        
    }
}
