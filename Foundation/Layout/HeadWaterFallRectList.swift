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
    var summaryHeights : Array<CGFloat> = Array() //摘要高度
    
    override var beginY : CGFloat{
        
        let height = self.totalSummaryHeight()
        
        let y : CGFloat = self.sectionHeaderHeight + height + self.insets.top
        
        return y
    }
    
    func appendSummaryRect(itemHeight:CGFloat)
    {
        let height = self.totalSummaryHeight()
        
        let rect = CGRect(x: 0, y: self.sectionHeaderHeight + height, width: self.width, height: itemHeight)
        
        self.rects.append(rect)
        
        self.summaryHeights.append(itemHeight)
        
        self.resetColumnHeights()
    }
    
    func totalSummaryHeight() -> CGFloat
    {
        var height : CGFloat = 0.0
        for i in 0..<self.summaryHeights.count
        {
            height += self.summaryHeights[i]
        }
        
        return height
    }
}
