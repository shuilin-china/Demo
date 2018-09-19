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
    
    func onAddKey(_ keyText:String?, callback:@escaping ResultCallback)
    {
        let key = keyText?.trimmingCharacters(in: .whitespaces)
        if key == nil || key!.count == 0
        {
            let error : NSError = NSError(domain: "关键字不能为空", code: 1, userInfo: nil)
            callback(error)
            return
        }
        
        //先把关键字记录下来
        let request = AddCourseKeyRequest()
        request.key = key!
        
        request.send { (error) in
            
            if error == nil
            {
                //通知有新值加入
                NotificationCenter.default.post(name:NSNotification.Name(kCourseKeyAddNotification), object: self, userInfo: nil)
            }
            
            callback(error)
        }
    }
    
    func onClear(callback:@escaping ResultCallback)
    {
        let request = ClearCourseKeyRequest()
        request.send { (error) in
            
            callback(error)
        }
    }
    
    func onLoad(callback:@escaping ResultCallback)
    {
        let request = QueryCourseKeyRequest()
        request.send { (error) in
            if error == nil
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
                item.clickCommand = ProtocolCommand(target: self, selector: #selector(onClickKeyItem(params:)))
                
                self.items.append(item)
            }
        }
    }
    
    func sectionCount() -> Int
    {
        return 1
    }
    
    func cellCountAtSection(section:Int) -> Int
    {
        return self.items.count
    }
    
    func cellItemAt(indexPath:IndexPath) -> CourseKeyCellItem?
    {
        let index = indexPath.row
        
        if index < self.items.count
        {
            return self.items[index] as? CourseKeyCellItem
        }
        
        return nil
    }
    
    func isEmpty() -> Bool
    {
        return self.items.count == 0
    }
    
    @objc func onClickKeyItem(params:Array<Any>)
    {
        self.clickKeyCellCommand?.execute(params)
    }
}
