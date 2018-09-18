//
//  SearchCourseInfo.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchCourseInfo: NSObject ,Decodable {

    var name : String?
    var thumbImageUrl: String?
    var org_name : String?
    
    func setWithJson(json:Any?)
    {
        if json == nil
        {
            return
        }
        
        self.name = JSON(json!)["name"].string
        self.thumbImageUrl = JSON(json!)["thumbnail"].string
        self.org_name = JSON(json!)["org_name"].string
    }
    
    class func createInfos(dicts:Array<Any>?) -> Array<Any>?
    {
        if dicts == nil
        {
            return nil
        }
        
        var infos : Array<Any> = Array()
        
        for dict in dicts!
        {
            let info = SearchCourseInfo()
            info.setWithJson(json: dict)
            infos.append(info)
        }
        
        return infos
    }
}
