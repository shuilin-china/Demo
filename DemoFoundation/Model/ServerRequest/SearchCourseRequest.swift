//
//  SearchCourseRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchCourseRequest: NSObject {
    
    var keyword : String = ""
    var offset : Int = 0 //默认
    var limit : Int = 6 //默认
    var courseInfos : Array<Any> = Array()
    
    deinit{
        print("(-) SearchCourseRequest")
    }

    func send(callback:@escaping ResultCallback) {
        
        let parameters: Dictionary<String, Any> = [
            "keyword": self.keyword,
            "type": "all",
            "course_id": "",
            "offset": "\(self.offset)",
            "limit": "\(self.limit)",
            "course_type": "0,1",
            ]
        
        let request : DemoHttpRequest = DemoHttpRequest()
        request.params = parameters
        
        let url = DemoURLManager.sharedInstance.searchCourseUrl()
        request.url = url
        request.method = .HTTP_GET
        
        request.send { (error) in
            
            if error == nil
            {
                let infoDicts = JSON(request.response)["courses"].array
                let infos : Array<Any>? = SearchCourseInfo.createInfos(dicts: infoDicts)
                
                if infos != nil
                {
                    self.courseInfos = self.courseInfos + infos!        //不能用append
                }
                
            }
            
            callback(error)
        }
        
        
        
        /*
        request.send { (error) in
            if error == nil
            {
                let json = request.response
                
                if let dict = json as? Dictionary<String,Any>
                {
                    if let courses = dict["courses"] as? Array<Any>
                    {
                        //var infos = self.courseInfos
                        for course in courses
                        {
                            if let courseDict = course as? Dictionary<String,Any>
                            {
                                let info : SearchCourseInfo = SearchCourseInfo()
                                info.name = exString(courseDict["name"] as? String)
                                info.thumbImageUrl = exString(courseDict["thumbnail"] as? String)
                                info.org_name = exString(courseDict["org_name"] as? String)
                                
                                self.courseInfos.append(info)
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
        }*/
 
    }
}
