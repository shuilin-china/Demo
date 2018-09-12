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
    var courseItems : Array<Any> = Array()
    var clickCourseCellCommand : ProtocolCommand?
    
    deinit{
        print("(-) SearchCourseTableItem")
    }
    
    func onSearch(callback:@escaping ResultCallback) -> Void
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
        request.offset = 0
        request.limit = 9
        request.send { (error) in
            
            if error == nil //成功
            {
                //print(request.courseInfos)
                self.courseInfos = request.courseInfos
                
                self.onUpdate()
            }
            
            callback(error)
        }
    }
    
    func onUpdate()
    {
        self.courseItems.removeAll()
        
        for temp in self.courseInfos
        {
            if let info = temp as? SearchCourseInfo
            {
                let item : SearchCourseCellItem = SearchCourseCellItem()
                item.title = info.name
                item.desc = info.org_name
                item.imageUrl = info.thumbImageUrl
                item.height = 70
                item.clickCommand = ProtocolCommand(target: self, selector: #selector(onClickCourseItem))
                
                self.courseItems.append(item)
            }
        }
    }
    
    func sectionCount() -> Int
    {
        return 1
    }
    
    func cellCountAtSection(section:Int) -> Int
    {
        return self.courseItems.count
    }
    
    func cellItemAt(indexPath:IndexPath) -> SearchCourseCellItem?
    {
        let index = indexPath.row
        
        if index < self.courseItems.count
        {
            return self.courseItems[index] as? SearchCourseCellItem
        }
        
        return nil
    }
    
    @objc func onClickCourseItem(params:Array<Any>)
    {
        self.clickCourseCellCommand?.execute(params)
    }
    
}
