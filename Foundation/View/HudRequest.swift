//
//  HudRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/17.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class HudRequest: NSObject {

    class func show(text:String?)
    {
        if text != nil
        {
            SwiftNotice.showText(text!, autoClear: true, autoClearTime: 2)
        }
        else
        {
            SwiftNotice.showText("")
        }
    }
    
    class func showLoading(_ loading : Bool)
    {
        if(loading)
        {
            SwiftNotice.wait()
        }
        else
        {
            SwiftNotice.clear()
        }
    }
}
