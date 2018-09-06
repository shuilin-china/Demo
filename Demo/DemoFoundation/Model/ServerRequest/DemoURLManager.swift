//
//  DemoURLManager.swift
//  Demo
//
//  Created by Foryou on 2018/9/4.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//服务端接口地址管理器
class DemoURLManager: NSObject {
    
    static let sharedInstance = DemoURLManager ()
    
    //当前接口环境ID，默认0
    var currentEviromentID : Int!
    
    override init() {
        currentEviromentID = 0;
    }

    //主服务器地址
    func mainHost () -> String!
    {
        if currentEviromentID == 0
        {
            return "www.xuetangx.com"
        }
        
        return ""
    }
    
    //
    func commonHost () -> String!
    {
        if currentEviromentID == 0
        {
            return "common.xuetangx.com"
        }
        
        return ""
    }
    
    func scheme () -> String!
    {
        if currentEviromentID == 0
        {
            return "http://"
        }
        
        return ""
    }
    
    func basePath () -> String!
    {
        return "/api"
    }
    
    //搜索接口
    func searchCourseUrl() -> String!
    {
        let url = scheme() + mainHost() + basePath() + "/v2/search"
        
        return url
    }
}
