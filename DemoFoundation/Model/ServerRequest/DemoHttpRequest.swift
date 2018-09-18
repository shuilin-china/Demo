//
//  DemoHttpRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/5.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import Alamofire


class DemoHttpRequest: NSObject {

    var url : String?
    var method : HTTP_Method
    var params : Dictionary<String, Any>?
    
    var response : Any?
    
    override init() {
        self.method = .HTTP_POST
    }

    func send(callback:@escaping ResultCallback)
    {
        var method : HTTPMethod?
        
        switch self.method {
            
        case .HTTP_GET:
            method = .get
        case .HTTP_POST:
            method = .post
        case .HTTP_PUT:
            method = .put
        case .HTTP_DELETE:
            method = .delete
        }
        
        
        if url != nil && method != nil
        {
            Alamofire.request(url!, method: method!, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
                
                switch response.result {
                    
                case .success(let json):
                    self.response = json as Any?
                    callback(nil)
                    
                case .failure(let error):
                    print("\(error)")
                    callback(error)
                }
            }
        }
        else
        {
            print("url 或者 method 为nil")
            
            callback(nil)
        }
    }
}
