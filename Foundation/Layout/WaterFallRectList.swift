//
//  WaterFallRectList.swift
//  Demo
//
//  Created by Foryou on 2018/10/10.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//瀑布流布局模型

class WaterFallRectList: NSObject, FCRectList {

    var column : UInt    //列数，最小为1
    var insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //四个边距
    var inter : CGFloat = 10    //cell横向间距
    var lineSpace : CGFloat = 10 //cell纵向间距
    var width : CGFloat = 100   //视图宽度,外部要设置
    var sectionHeaderHeight : CGFloat = 0.0 //头部高度
    
    var itemWidth : CGFloat{
        get{
            return ((self.width - self.insets.left - self.insets.right) - CGFloat(column - 1) * self.inter) / CGFloat(self.column)
        }
    }
    
    private(set) var rects : Array<CGRect> = Array()
    private(set) var columnHeights : Dictionary<UInt, CGFloat> = Dictionary() //每列的总高度
    
    init(column : UInt) {
        
        self.column = column
        
        super.init()
        
        self.clear()
    }
    
    //增加rect
    func appendRect(itemHeight:CGFloat)
    {
        if self.column == 0 //列数不能为0
        {
            return
        }
        
        //获取最短的那一列
        let (j, h) = self.minHeightColumn()
        
        //平分宽度
        let itemWidth = self.itemWidth
        
        //确定此项左上角坐标
        let x = self.insets.left + CGFloat(j) * (itemWidth + self.inter)
        let y = (h == self.beginY) ? h : h + self.lineSpace
        
        //记录下计算结果
        let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
        self.rects.append(rect)
        
        //更新此列总高度
        self.columnHeights[j] = y + itemHeight
    }
    
    //清空
    func clear()
    {
        self.rects.removeAll()
        self.columnHeights.removeAll()
        
        //设置每列总高度的初始值
        for i in 0..<self.column
        {
            self.columnHeights[i] = self.beginY
        }
    }
    
    //获取最小总高度的列
    func minHeightColumn() -> (UInt, CGFloat)
    {
        var minJ : UInt = 0
        var minHeight : CGFloat? = self.columnHeights[minJ]
        
        if minHeight == nil
        {
            return (0, 0.0)
        }
        
        for (j, height) in self.columnHeights
        {
            if height < minHeight!
            {
                minHeight = height
                minJ = j
            }
        }
        
        return (minJ, minHeight!)
    }
    
    //获取最大总高度
    func maxHeight() -> CGFloat
    {
        let maxJ : UInt = 0
        var maxHeight : CGFloat? = self.columnHeights[maxJ]
        
        if maxHeight == nil
        {
            return 0.0
        }
        
        for (_, height) in self.columnHeights
        {
            if height > maxHeight!
            {
                maxHeight = height
            }
        }
        
        return maxHeight!
    }
    
    //获取开始的y值
    var beginY : CGFloat{
        return self.sectionHeaderHeight + self.insets.top
    }
    
    //实现流布局协议
    func fc_rectAt(indexPath: IndexPath) -> CGRect? {
        
        let index = indexPath.row
        if index < self.rects.count
        {
            return self.rects[index]
        }
        
        return nil;
    }
    
    var fc_size: CGSize
    {
        get {
            let height = self.maxHeight() + self.insets.bottom
            
            return CGSize(width: width, height: height)
        }
    }
    
}
