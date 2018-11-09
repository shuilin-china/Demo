//
//  OldEditOrderItem.swift
//  Demo
//
//  Created by Foryou on 2018/11/1.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class OldEditOrderItem: EditOrderItem {

    var info : Any?
    
    override func load(callback: @escaping ResultCallback) {
        
        //把info值赋给ctx
        
        //...
        
        super.update()
        
        callback(nil)
    }
}
