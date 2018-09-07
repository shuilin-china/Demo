//
//  SearchCourseItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/7.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseItem: NSObject {

    var text : String?
    var courseInfos : Array<Any> = Array()
    
    deinit{
        print("(-) SearchCourseItem")
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
                self.courseInfos = request.courseInfos
                
                self.onUpdate()
            }
            
            callback(error)
        }
    }
    
    func onUpdate()
    {
        
    }
    
}
