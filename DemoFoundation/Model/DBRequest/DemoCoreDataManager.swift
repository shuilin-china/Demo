//
//  DemoCoreDataManager.swift
//  Demo
//
//  Created by Foryou on 2018/9/13.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class DemoCoreDataManager: NSObject {

    static let sharedInstance = DemoCoreDataManager ()
    let queue = DispatchQueue(label: "com.demo.demo")//串行
    
    override init() {
        
    }
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "Demo", withExtension: "momd")
        let managedObjectModel = NSManagedObjectModel.init(contentsOf: modelURL!)
        return managedObjectModel!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator.init(managedObjectModel: managedObjectModel)
        let sqliteURL = documentDir.appendingPathComponent("Demo.sqlite")
        let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqliteURL, options: options)
        } catch {
            // Report any error we got.
            var dict = [String: Any]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as Any?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as Any?
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 6666, userInfo: dict)
            print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return persistentStoreCoordinator
    }()
    
    lazy var documentDir: URL = {
        let documentDir = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
        return documentDir!
    }()
    
    lazy var moc: NSManagedObjectContext = {
        
        let context = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        
        return context
    }()
    
    class func saveContext(moc:NSManagedObjectContext) -> Error?
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
    
    class func query(fetchRequest:NSFetchRequest<NSManagedObject>, moc:NSManagedObjectContext) -> (Array<Any>?,Error?) {
        
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
