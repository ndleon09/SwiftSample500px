//
//  File.swift
//  pictures
//
//  Created by Nelson Dominguez on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailDataManager: DetailDataManagerProtocol {
    
    var persistenceLayer : PersistenceLayerProtocol?
    
    func findDetailPhoto(identifier: Double, completion: @escaping (PictureModel?) -> ()) {
        
        persistenceLayer?.findPicture(id: identifier, completion: { object in
            
            guard let managedObject = object else {
                completion(nil); return
            }
            
            let keys = Array(managedObject.entity.attributesByName.keys)
            let dictionary = managedObject.dictionaryWithValues(forKeys: keys)
            let picture = PictureModel(coreDataDictionary: dictionary)
            completion(picture)
        })
    }
}
