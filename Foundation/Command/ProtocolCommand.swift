//
//  ProtocolCommand.swift
//  Demo
//
//  Created by Foryou on 2018/9/6.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class ProtocolCommand: NSObject {
    
    var target : AnyObject!
    var selector : Selector!
    init(target:AnyObject, selector:Selector)
    {
        self.target = target
        self.selector = selector
    }
    
    //无返回值的
    func execute(_ params: Array<Any?>) -> Void
    {
        if self.target.responds(to: self.selector)
        {
            self.target.perform(self.selector, with: params)
        }
    }
    
    //有返回值的
    func executeR(_ params: Array<Any?>) -> AnyObject?
    {
        if self.target.responds(to: self.selector)
        {
            let object : Unmanaged<AnyObject>? = self.target.perform(self.selector, with: params)
            
            if object != nil
            {
                let result : AnyObject? = object!.takeUnretainedValue()
                return result
            }
            else
            {
                return nil;
            }
        }
        
        return nil
    }
}
