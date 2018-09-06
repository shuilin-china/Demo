//
//  SearchCourseRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseRequest: DemoHttpRequest {
    
    var courseInfos : Array<Any>?

    override func send(callback:@escaping ResultCallback) {
        
        let parameters: Dictionary<String, Any> = [
            "keyword": "english",
            "type": "all",
            "course_id": "",
            "offset": "0",
            "limit": "6",
            "course_type": "0,1",
            ]
        self.params = parameters
        
        let url = DemoURLManager.sharedInstance.searchCourseUrl()
        self.url = url
        self.method = .HTTP_GET
        
        super.send { (error) in
            if error == nil
            {
                let json = self.response
                
                if let dict = json as? Dictionary<String,Any>
                {
                    if let courses = dict["courses"] as? Array<Any>
                    {
                        var infos : Array<Any> = Array()
                        for course in courses
                        {
                            if let courseDict = course as? Dictionary<String,Any>
                            {
                                let info : SearchCourseInfo = SearchCourseInfo()
                                info.name = courseDict["name"] as? String
                                info.thumbImageUrl = courseDict["thumbnail"] as? String
                                info.org_name = courseDict["org_name"] as? String
                                
                                infos.append(info)
                            }
                            
                        }
                        
                        self.courseInfos = infos;
                    }
                    else
                    {
                        print("courses is nil")
                    }
                    
                    //print(dict)
                }
            }
            else
            {
                //print(error!)
            }
            
            callback(error)
        }
        
    }
}
