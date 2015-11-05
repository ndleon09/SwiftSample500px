//
//  CoreDataStore.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore: NSObject {

    var persistentStoreCoordinator : NSPersistentStoreCoordinator?
    var managedObjectModel : NSManagedObjectModel?
    var managedObjectContext : NSManagedObjectContext?
    
    override init() {
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        
        let domains = NSSearchPathDomainMask.UserDomainMask
        let directory = NSSearchPathDirectory.DocumentDirectory
        
        let applicationDocumentsDirectory : AnyObject = NSFileManager.defaultManager().URLsForDirectory(directory, inDomains: domains).last!
        let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
        let storeURL = applicationDocumentsDirectory.URLByAppendingPathComponent("MostPopularPhotos.sqlite")
        
        do {
            try persistentStoreCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        managedObjectContext!.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext!.undoManager = nil
        
        super.init()
    }
}
