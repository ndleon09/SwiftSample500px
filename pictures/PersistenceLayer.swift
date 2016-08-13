//
//  CoreDataStore.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation
import CoreData

protocol PersistenceLayerProtocol: class {
    
    func fetchPicturesEntriesWithPredicate(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completionBlock: ([PictureDataModel]) -> ())
    func findPicture(id: Double, completion: (PictureDataModel?) -> ())
    func newPictureDataModel() -> PictureDataModel
    func save()
}

class PersistenceLayer: PersistenceLayerProtocol {

    private var persistentStoreCoordinator : NSPersistentStoreCoordinator!
    private var managedObjectModel : NSManagedObjectModel!
    private var managedObjectContext : NSManagedObjectContext!
    
    init() {
        
        guard let modelURL = NSBundle.mainBundle().URLForResource("PicturesDataModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from \(modelURL)")
        }
        
        managedObjectModel = mom
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let applicationDocumentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last!
        let storeURL = applicationDocumentsDirectory.URLByAppendingPathComponent("MostPopularPhotos.sqlite")
        
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    func fetchPicturesEntriesWithPredicate(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completionBlock: ([PictureDataModel]) -> ()) {
        
        let fetchRequest = NSFetchRequest(entityName: "PictureDataModel")
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        managedObjectContext.performBlock {
            
            do {
                let queryResults = try self.managedObjectContext.executeFetchRequest(fetchRequest)
                let managedResults = queryResults as! [PictureDataModel]
                completionBlock(managedResults)
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func findPicture(id: Double, completion: (PictureDataModel?) -> ()) {
        
        let predicate = NSPredicate(format: "id == %lf", id)
        fetchPicturesEntriesWithPredicate(predicate, sortDescriptors: nil) { pictures in
            completion(pictures.first)
        }
    }
    
    func newPictureDataModel() -> PictureDataModel {
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName(String(PictureDataModel), inManagedObjectContext: managedObjectContext)
        return entity as! PictureDataModel
    }
    
    func save() {
        
        do {
            try managedObjectContext.save()
        }
        catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
