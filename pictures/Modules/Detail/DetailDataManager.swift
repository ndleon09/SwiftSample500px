//
//  File.swift
//  pictures
//
//  Created by Nelson Dominguez on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailDataManager: NSObject {
    
    var coreDataStore : CoreDataStore!
    
    func findDetailPhoto(photo: Double, completion: (PictureDataModel?) -> ()) {
        
        coreDataStore.findPicture(photo, completion: { picture in
            completion(picture)
        })
    }
}