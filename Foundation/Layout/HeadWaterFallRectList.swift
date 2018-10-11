//
//  HeadWaterFallRectList.swift
//  Demo
//
//  Created by Foryou on 2018/10/11.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class HeadWaterFallRectList: WaterFallRectList {

    var sectionHeaderHeight : CGFloat = 0.0 //头部高度
    
    override var beginY : CGFloat{
        return self.sectionHeaderHeight + self.insets.top
    }
}
