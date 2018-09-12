//
//  DemoCoreDataRequestManager.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import CoreData

class DemoCoreDataRequestManager: NSObject {

    static let sharedInstance = DemoCoreDataRequestManager ()
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

    private lazy var moc: NSManagedObjectContext = {
        
        let context = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        
        return context
    }()
    
    func sendRequest(request:DemoCoreDataRequest, callback:@escaping DataResultCallback)
    {
        queue.async {
            
            let (data,error) = request.execute(moc: self.moc)
            
            //在主线程返回
            mainDataResultCallback(callback: callback, data: data, error: error)
        }
    }
}
