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
    
    func fetchPicturesEntries(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completionBlock: @escaping ([PictureDataModel]) -> Void)
    func findPicture(id: Double, completion: @escaping (PictureDataModel?) -> Void)
    func newPictureDataModel() -> PictureDataModel
    func save()
}

class PersistenceLayer: PersistenceLayerProtocol {

    fileprivate var persistentStoreCoordinator : NSPersistentStoreCoordinator!
    fileprivate var managedObjectModel : NSManagedObjectModel!
    fileprivate var managedObjectContext : NSManagedObjectContext!
    
    init() {
        
        guard let modelURL = Bundle.main.url(forResource: "PicturesDataModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from \(modelURL)")
        }
        
        managedObjectModel = mom
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let applicationDocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let storeURL = applicationDocumentsDirectory.appendingPathComponent("MostPopularPhotos.sqlite")
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    func fetchPicturesEntries(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completionBlock: @escaping ([PictureDataModel]) -> Void) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PictureDataModel")
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        managedObjectContext.perform {
            
            do {
                let queryResults = try self.managedObjectContext.fetch(fetchRequest)
                let managedResults = queryResults as! [PictureDataModel]
                completionBlock(managedResults)
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func findPicture(id: Double, completion: @escaping (PictureDataModel?) -> Void) {
        
        let predicate = NSPredicate(format: "id == %lf", id)
        fetchPicturesEntries(predicate: predicate, sortDescriptors: nil, completionBlock: { pictures in
            completion(pictures.first)
        })
    }
    
    func newPictureDataModel() -> PictureDataModel {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: String(describing: PictureDataModel.self), into: managedObjectContext)
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
