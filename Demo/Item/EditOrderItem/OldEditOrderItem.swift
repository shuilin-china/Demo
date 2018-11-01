//
//  OldEditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/11/1.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class OldEditOrderItem: EditOrderItem {

    var oldInfo : Any?
    
    override func load(callback: @escaping ResultCallback) {
        
        self.info = EditOrderInfo()
        
        //把oldInfo值赋给info
        
        //...
        
        super.update()
        
        callback(nil)
    }
}
