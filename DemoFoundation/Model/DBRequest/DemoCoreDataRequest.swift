//
//  DemoCoreDataRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

//Coredata数据库请求基类
class DemoCoreDataRequest: NSObject {

    var response : Any?
    
    func send(callback:@escaping ResultCallback)
    {
        DemoCoreDataRequestManager.sharedInstance .sendRequest(request: self) { (data, error) in
            
            self.response = data
            
            callback(error)
        }
    }
    
    func execute(moc : NSManagedObjectContext) -> (Any? , Error?)
    {
        return (nil, nil)
    }
}
