//
//  SearchCourseCollectionItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseCollectionItem: NSObject {

    
    var text : String?
    var courseInfos : Array<Any> = Array()
    var items : Array<Any> = Array()
    var clickCourseCellCommand : ProtocolCommand?
    var offset : Int = 0;
    @objc dynamic var bEmpty : Bool = true
    weak var currentLoadRequest : SearchCourseRequest?
    
    deinit{
        print("(-) SearchCourseCollectionItem")
    }
    
    func onSearch(callback:@escaping ResultCallback) -> Void
    {
        let text = self.text?.trimmingCharacters(in: .whitespaces)
        
        if text == nil || text!.count == 0
        {
            let error : NSError = NSError.create(code: 1, message: "请输入关键字")
            callback(error)
            return
        }
        self.offset = 0;
        
        let request : SearchCourseRequest = SearchCourseRequest()
        request.keyword = text!
        request.offset = self.offset
        request.limit = 9
        
        self.currentLoadRequest = request
        request.send { (error) in
            
            if request != self.currentLoadRequest
            {
                let err = NSError.create(code: kErrorCode_Cancel, message: "已取消本次请求")
                callback(err)
                return
            }
            
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
        let text = self.text?.trimmingCharacters(in: .whitespaces)
        
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
        request.send { (err) in
            
            var error = err
            if error == nil //成功
            {
                //print(request.courseInfos)
                if request.courseInfos.count > 0
                {
                    self.onAppend(infos: request.courseInfos)
                    
                    self.offset += request.limit
                }
                else
                {
                    error = NSError.create(code: 10, message: "没有更多课程了")
                }
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
                let item : SearchCourseRectItem = SearchCourseRectItem()
                item.onUpdate(info: info)
                item.clickCommand = ProtocolCommand(target: self, selector: #selector(onClickCourseItem(params:)))
                
                self.items.append(item)
            }
        }
        
        self.bEmpty = (self.items.count == 0)
    }
    
    func sectionCount() -> Int
    {
        return 1
    }
    
    func cellCountAtSection(section:Int) -> Int
    {
        return self.items.count
    }
    
    func cellItemAt(indexPath:IndexPath) -> SearchCourseRectItem?
    {
        let index = indexPath.row
        
        if index < self.items.count
        {
            return self.items[index] as? SearchCourseRectItem
        }
        
        return nil
    }
    
    @objc func onClickCourseItem(params:Array<Any>)
    {
        self.clickCourseCellCommand?.execute(params)
    }
}
