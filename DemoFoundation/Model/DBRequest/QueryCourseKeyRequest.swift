//
//  QueryCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class QueryCourseKeyRequest: NSObject {
    
    var keys : Array<String?> = Array()
    
    func send(callback: @escaping ResultCallback) {
        
        let queue = DemoCoreDataManager.sharedInstance.queue
        
        queue.async {
            
            let moc = DemoCoreDataManager.sharedInstance.moc
            
            let fetchRequest: NSFetchRequest = CourseKeyEntity.fetchRequest()
            //fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            let request = fetchRequest as! NSFetchRequest<NSManagedObject>
            
            let (objects,error) = DemoCoreDataManager.query(fetchRequest:request,moc: moc)
            
            var keys : Array<String?> = Array()
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
            
            keys = keys.reversed()
            
            DispatchQueue.main.async {
                
                self.keys = keys
                
                callback(error)
            }
        }
    }
    
}
