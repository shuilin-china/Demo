//
//  EditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class EditOrderItem: NSObject {

    private(set) var ctx : EditOrderItemContext
    private(set) var cellItems : Array<EditOrderCellItem> = Array()
    var clickTimeCommand : ProtocolCommand?
    var clickPointCommand : ProtocolCommand?
    
    init(ctx : EditOrderItemContext)
    {
        self.ctx = ctx
        
        super.init()
    }
    
    func load(callback:@escaping ResultCallback){
        
        //子类重写
        
        callback(nil)
    }
    
    func submit(callback:@escaping ResultCallback){
        
        let request : SubmitOrderRequest = SubmitOrderRequest()
        
        //把ctx中的值赋给request
        //...
        
        request.send { (error) in
            
            callback(error)
        }
    }
    
    func update(){
        
        //确定表项
        self.cellItems.removeAll()
        
        //根据ctx创建CellItem
        for i in 0..<self.ctx.pointInfos.count
        {
            let cellItem : EditOrderPointCellItem = EditOrderPointCellItem(ctx: self.ctx)
            cellItem.index = i
            cellItem.clickCommand = self.clickPointCommand
            cellItem .update()
            
            self.cellItems.append(cellItem)
        }
        
        if self.ctx.timeOn
        {
            let loadTimeCellItem : EditOrderTimeCellItem = EditOrderTimeCellItem(ctx: self.ctx)
            loadTimeCellItem.clickCommand = ProtocolCommand(target: self, selector: #selector(clickedLoadTimeCellItem(params:)))
            loadTimeCellItem.update()
            
            self.cellItems.append(loadTimeCellItem)
        }
    }
    
    @objc func clickedLoadTimeCellItem(params : Array<Any>)
    {
        self.clickTimeCommand?.execute([nil])
    }
}
