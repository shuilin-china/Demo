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
    
    //子类重写
    func execute(moc : NSManagedObjectContext) -> (Any? , Error?)
    {
        return (nil, nil)
    }
    
    func saveContext(moc : NSManagedObjectContext) -> Error?
    {
        var err : Error?
        
        do {
            try moc.save()
        } catch {
            //let nserror = error as NSError
            //fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
            err = error
        }
        
        return err
    }
    
    func query(fetchRequest:NSFetchRequest<NSManagedObject>, moc:NSManagedObjectContext) -> (Array<Any>?,Error?) {
        
        var err : Error?
        var result : Array<Any>?
        
        do {
            result = try moc.fetch(fetchRequest)
        } catch {
            //fatalError();
            err = error
        }
        
        return (result, err)
    }
}
