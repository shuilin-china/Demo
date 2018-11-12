//
//  NewEditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/11/1.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class NewEditOrderItem: EditOrderItem {

    override func load(callback: @escaping ResultCallback) {
        
        //赋默认值
        self.ctx.pointInfos.removeAll()
        
        let info : EditOrderPointInfo = EditOrderPointInfo()
        self.ctx.pointInfos.append(info)
        
        let info2 : EditOrderPointInfo = EditOrderPointInfo()
        self.ctx.pointInfos.append(info2)
        
        //测试界面展示
        self.ctx.loadTimeStamp = 50000
        self.ctx.timeOn = true
        
        super.update()
        
        callback(nil)
    }
}
