//
//  AddCourseKeyRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class AddCourseKeyRequest: NSObject {
    
    var key : String = ""
    
    func send(callback: @escaping ResultCallback) {
        
        let key = self.key
        
        let queue = DemoCoreDataManager.sharedInstance.queue
        
        queue.async {
            
            let moc = DemoCoreDataManager.sharedInstance.moc
            
            //先删除掉同样的关键字
            let fetchRequest: NSFetchRequest = CourseKeyEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title == %@", key)
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
            }
            
            //再加入新的
            let entity = NSEntityDescription.insertNewObject(forEntityName: "CourseKeyEntity", into: moc) as! CourseKeyEntity
            entity.title = key
            error = DemoCoreDataManager.saveContext(moc: moc)
            
            DispatchQueue.main.async {
                
                callback(error)
            }
        }
    }
}
