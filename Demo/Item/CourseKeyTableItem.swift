//
//  CourseKeyTableItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/11.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class CourseKeyTableItem: NSObject {

    var keys : Array<Any> = Array()
    var items : Array<Any> = Array()
    var clickKeyCellCommand : ProtocolCommand?
    
    func onAdd(key:String!, callback:@escaping ResultCallback)
    {
        let request = AddCourseKeyRequest()
        request.key = key
        
        request.send { (error) in
            
            //加入成功
            if error == nil
            {
                //刷新列表
                self.onLoad(callback: { (error) in
                    
                    callback(error)
                })
            }
            else
            {
                callback(error)
            }
            
        }
    }
    
    func onClear(callback:@escaping ResultCallback)
    {
        
    }
    
    func onLoad(callback:@escaping ResultCallback)
    {
        let request = QueryCourseKeyRequest()
        request.send { (error) in
            if error != nil
            {
                self.onUpdate(keys: request.keys)
            }
            
            callback(error)
        }
    }
    
    func onUpdate(keys:Array<Any>)
    {
        self.keys.removeAll()
        self.items.removeAll()
        
        self.onAppend(keys: keys)
    }
    
    func onAppend(keys:Array<Any>)
    {
        self.keys.append(keys)
        
        for temp in keys
        {
            if let key = temp as? String
            {
                let item : CourseKeyCellItem = CourseKeyCellItem()
                item.title = key
                item.height = 38
                item.clickCommand = ProtocolCommand(target: self, selector: #selector(onClickKeyItem))
                
                self.items.append(item)
            }
        }
    }
    
    @objc func onClickKeyItem(params:Array<Any>)
    {
        self.clickKeyCellCommand?.execute(params)
    }
}
