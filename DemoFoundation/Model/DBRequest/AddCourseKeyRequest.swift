//
//  AddCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class AddCourseKeyRequest: DemoCoreDataRequest {
    
    var key : String = ""
    
    override func execute(moc : NSManagedObjectContext) -> (Any?, Error?) {
        
        return (nil, nil)
    }
}
