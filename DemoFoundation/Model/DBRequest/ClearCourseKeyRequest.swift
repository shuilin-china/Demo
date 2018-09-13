//
//  ClearCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class ClearCourseKeyRequest: NSObject {
    
    func send(callback: @escaping ResultCallback) {
        
        let queue = DemoCoreDataManager.sharedInstance.queue
        queue.async {
            
            let moc = DemoCoreDataManager.sharedInstance.moc
            
            let fetchRequest: NSFetchRequest = CourseKeyEntity.fetchRequest()
            let request = fetchRequest as! NSFetchRequest<NSManagedObject>
            
            var (objects,error) = DemoCoreDataManager.query(fetchRequest:request,moc: moc)
            
            if objects != nil
            {
                for object in objects!
                {
                    if let entity = object as? NSManagedObject
                    {
                        moc.delete(entity)
                    }
                }
                
                error = DemoCoreDataManager.saveContext(moc: moc)
            }
            
            DispatchQueue.main.async {
                
                callback(error)
            }
        }
    }
    
    
}
