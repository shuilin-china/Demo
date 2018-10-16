//
//  ColorHelper.swift
//  Demo
//
//  Created by Foryou on 2018/10/16.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

extension UIColor {
    
 
    //用数值初始化颜色，便于生成设计图上标明的十六进制颜色
    
    convenience init(hex: UInt, alpha: CGFloat) {
        
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: alpha)
        
    }
    
    /*
    convenience init(hexColor: String) {
        // 用十六进制颜色创建UIColor

        // 存储转换后的数值

        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)

    }
 */
}
