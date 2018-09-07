//
//  SearchCourseRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseRequest: DemoHttpRequest {
    
    var keyword : String = ""
    var offset : Int = 0 
    var limit : Int = 6
    var courseInfos : Array<Any> = Array()
    
    deinit{
        print("(-) SearchCourseRequest")
    }

    override func send(callback:@escaping ResultCallback) {
        
        let parameters: Dictionary<String, Any> = [
            "keyword": self.keyword,
            "type": "all",
            "course_id": "",
            "offset": "\(self.offset)",
            "limit": "\(self.limit)",
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
                        var infos = self.courseInfos
                        for course in courses
                        {
                            if let courseDict = course as? Dictionary<String,Any>
                            {
                                let info : SearchCourseInfo = SearchCourseInfo()
                                info.name = exString(courseDict["name"] as? String)
                                info.thumbImageUrl = exString(courseDict["thumbnail"] as? String)
                                info.org_name = exString(courseDict["org_name"] as? String)
                                
                                infos.append(info)
                            }
                            
                        }
                        
                    }
                    else
                    {
                        //print("courses is nil")
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
