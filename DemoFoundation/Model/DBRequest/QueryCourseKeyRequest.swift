//
//  QueryCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class QueryCourseKeyRequest: DemoCoreDataRequest {
    
    var keys : Array<String?> = Array()

    override func execute(moc : NSManagedObjectContext) -> (Any?, Error?) {
        
        let fetchRequest: NSFetchRequest = CourseKeyEntity.fetchRequest()
        //fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        let request = fetchRequest as! NSFetchRequest<NSManagedObject>
        
        let (objects,error) = super.query(fetchRequest:request, moc: moc)
        
        if objects != nil
        {
            for object in objects!
            {
                if let entity = object as? CourseKeyEntity
                {
                    keys.append(entity.title)
                }
            }
        }
        
        return (keys, error)
    }
}
