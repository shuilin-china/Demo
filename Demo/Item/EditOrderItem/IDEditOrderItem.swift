//
//  IDEditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/11/1.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class IDEditOrderItem: EditOrderItem {

    var ID : String?
    
    override func load(callback: @escaping ResultCallback) {
        
        //根据ID请求数据
        
        //把请求回来的数据赋值给ctx
        
        //...
        
        super.update()
        
        callback(nil)
    }
}
