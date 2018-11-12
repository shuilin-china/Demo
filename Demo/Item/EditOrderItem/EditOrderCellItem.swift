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

    private(set) var ctx : EditOrderItemContext
    
    init(ctx : EditOrderItemContext)
    {
        self.ctx = ctx
        
        super.init()
    }
    
    override func update()
    {
        self.title = "装货时间";
        
        if self.ctx.isLoadTimeEmpty()
        {
            self.content = "请选择"
            self.contentColor = UIColor.lightGray
        }
        else
        {
            self.content = String(format: "[%ld]", self.ctx.loadTimeStamp)
            self.contentColor = UIColor.gray
        }
        
        self.height = 50
    }
    
    func setTime(day : String, hour : String)
    {
        //self.timeStamp = date?.timeIntervalSince1970
        
        let timeStamp = 60000
        self.ctx.loadTimeStamp = timeStamp
        
        self.update()
    }
}


//经停点
class EditOrderPointCellItem : EditOrderCellItem {
    
    var text : NSAttributedString?
    var index : Int = -1
    
    var clickCommand : ProtocolCommand?
    
    private(set) var ctx : EditOrderItemContext
    
    init(ctx : EditOrderItemContext)
    {
        self.ctx = ctx
        
        super.init()
    }
    
    override func update()
    {
        //创建富文本text
        if self.ctx.isPointEmpty(i: self.index)
        {
            
        }
        else
        {
            
        }
    }
}
