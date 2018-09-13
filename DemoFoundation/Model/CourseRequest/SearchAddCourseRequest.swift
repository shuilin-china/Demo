//
//  SearchAddCourseRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/13.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchAddCourseRequest: SearchCourseRequest {

    override func send(callback: @escaping ResultCallback) {
        
        //先把关键字记录下来
        let request = AddCourseKeyRequest()
        request.key = self.keyword
        
        request.send { (error) in
            
            if error == nil
            {
                //通知有新值加入
                NotificationCenter.default.post(name:NSNotification.Name(kCourseKeyAddNotification), object: self, userInfo: nil)
            }
            
            super.send(callback: { (error) in
                
                callback(error)
            })
        }
    }
}
