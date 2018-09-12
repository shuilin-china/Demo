//
//  CourseKeyTableItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/11.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class CourseKeyTableItem: NSObject {

    func onAdd(key:String!, callback:@escaping ResultCallback)
    {
        let request = AddCourseKeyRequest()
        request.key = key
        
        request.send { (error) in
            
        }
    }
    
    func onClear(callback:@escaping ResultCallback)
    {
        
    }
    
    func onLoad(callback:@escaping ResultCallback)
    {
        
    }
}
