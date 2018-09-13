//
//  SearchCourseTableItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/11.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseTableItem: NSObject {

    var text : String?
    var courseInfos : Array<Any> = Array()
    var items : Array<Any> = Array()
    var clickCourseCellCommand : ProtocolCommand?
    var offset : Int = 0;
    
    deinit{
        print("(-) SearchCourseTableItem")
    }
    
    func onSearch(callback:@escaping ResultCallback) -> Void
    {
        let text = self.text
        
        if text == nil || text!.count == 0
        {
            let error : NSError = NSError(domain: "请输入关键字", code: 1, userInfo: nil)
            callback(error)
            return
        }
        self.offset = 0;
        
        let request : SearchAddCourseRequest = SearchAddCourseRequest()
        request.keyword = text!
        request.offset = self.offset
        request.limit = 9
        request.send { (error) in
            
            if error == nil //成功
            {
                //print(request.courseInfos)
                
                self.onUpdate(infos: request.courseInfos)
                
                self.offset += request.limit
            }
            
            callback(error)
        }
    }
    
    func onSearchMore(callback:@escaping ResultCallback)
    {
        let text = self.text
        
        if text == nil || text!.count == 0
        {
            let error : NSError = NSError(domain: "没有指定搜索关键字", code: 1, userInfo: nil)
            callback(error)
            return
        }
        
        let request : SearchCourseRequest = SearchCourseRequest()
        request.keyword = text!
        request.offset = self.offset
        request.limit = 6
        request.send { (error) in
            
            if error == nil //成功
            {
                //print(request.courseInfos)
                self.onAppend(infos: request.courseInfos)
                
                self.offset += request.limit
            }
            
            callback(error)
        }
    }
    
    func onUpdate(infos:Array<Any>)
    {
        self.courseInfos.removeAll()
        self.items.removeAll()
        
        self.onAppend(infos: infos)
    }
    
    func onAppend(infos:Array<Any>)
    {
        self.courseInfos.append(infos)
        
        for temp in infos
        {
            if let info = temp as? SearchCourseInfo
            {
                let item : SearchCourseCellItem = SearchCourseCellItem()
                item.onUpdate(info: info)
                item.clickCommand = ProtocolCommand(target: self, selector: #selector(onClickCourseItem(params:)))
                
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
    
    func cellItemAt(indexPath:IndexPath) -> SearchCourseCellItem?
    {
        let index = indexPath.row
        
        if index < self.items.count
        {
            return self.items[index] as? SearchCourseCellItem
        }
        
        return nil
    }
    
    @objc func onClickCourseItem(params:Array<Any>)
    {
        self.clickCourseCellCommand?.execute(params)
    }
    
}
