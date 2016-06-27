//
//  File.swift
//  pictures
//
//  Created by Nelson Dominguez on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailDataManager: DetailDataManagerProtocol {
    
    var coreDataStore : CoreDataStore!
    
    func findDetailPhoto(identifier: Double, completion: (PictureModel?) -> ()) {
        
        coreDataStore.findPicture(identifier, completion: { object in
            
            if let managedObject = object {
                let keys = Array(managedObject.entity.attributesByName.keys)
                let dictionary = managedObject.dictionaryWithValuesForKeys(keys)
                let picture = PictureModel(coreDataDictionary: dictionary)
                completion(picture)
            }
            else {
                completion(nil)
            }
            
        })
    }
}