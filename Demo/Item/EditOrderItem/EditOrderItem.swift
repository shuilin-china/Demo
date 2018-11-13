//
//  EditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class EditOrderItem: NSObject {

    var order : EditOrder?
    private(set) var cellItems : Array<EditOrderCellItem> = Array()
    var clickTimeCommand : ProtocolCommand?
    var clickPointCommand : ProtocolCommand?
    
    func load(callback:@escaping ResultCallback){
        
        self.order?.load(callback: { (error) in
            
            if error == nil
            {
                self.update()
            }
            
            callback(error)
        })
    }
    
    func submit(callback:@escaping ResultCallback){
        
        self.order?.submit(callback: { (error) in
            
            callback(error)
        })
    }
    
    func update(){
        
        //确定表项
        self.cellItems.removeAll()
        
        //根据ctx创建CellItem
        
        if let order = self.order
        {
            for i in 0..<order.points.count
            {
                let cellItem : EditOrderPointCellItem = EditOrderPointCellItem()
                cellItem.order = order
                cellItem.index = i
                cellItem.clickCommand = self.clickPointCommand
                cellItem .update()
                
                self.cellItems.append(cellItem)
            }
            
            if order.timeOn
            {
                let loadTimeCellItem : EditOrderTimeCellItem = EditOrderTimeCellItem()
                loadTimeCellItem.order = order
                loadTimeCellItem.clickCommand = ProtocolCommand(target: self, selector: #selector(clickedLoadTimeCellItem(params:)))
                loadTimeCellItem.update()
                
                self.cellItems.append(loadTimeCellItem)
            }
        }
        
    }
    
    @objc func clickedLoadTimeCellItem(params : Array<Any>)
    {
        self.clickTimeCommand?.execute([nil])
    }
}
