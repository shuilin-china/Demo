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
        
        self.info = EditOrderInfo()
        
        super.update()
        
        callback(nil)
    }
}
