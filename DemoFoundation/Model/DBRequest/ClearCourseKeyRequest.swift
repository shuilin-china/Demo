//
//  ClearCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class ClearCourseKeyRequest: DemoCoreDataRequest {

    override func execute(moc : NSManagedObjectContext) -> (Any?, Error?) {
        
        let fetchRequest: NSFetchRequest = CourseKeyEntity.fetchRequest()
        let request = fetchRequest as! NSFetchRequest<NSManagedObject>
        
        var (objects,error) = super.query(fetchRequest:request, moc: moc)
        
        if objects != nil
        {
            for object in objects!
            {
                if let entity = object as? NSManagedObject
                {
                    moc.delete(entity)
                }
            }
            
            error = super.saveContext(moc:moc)
        }
        
        
        return (nil, error)
    }
}
