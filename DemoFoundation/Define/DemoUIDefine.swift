//
//  DemoUIDefine.swift
//  Demo
//
//  Created by Foryou on 2018/9/4.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit


let  SCREEN_WIDTH = UIScreen.main.bounds.size.width

let  SCREEN_HEIGHT = UIScreen.main.bounds.size.height


func dangerBottom(view : UIView) -> CGFloat{
    
    var dangerBottom : CGFloat = 0.0
    if #available(iOS 11.0, *) {
        
        let height : CGFloat = view.bounds.size.height
        dangerBottom = height - (view.safeAreaLayoutGuide.layoutFrame.origin.y + view.safeAreaLayoutGuide.layoutFrame.size.height)
    }
    
    return dangerBottom
}

