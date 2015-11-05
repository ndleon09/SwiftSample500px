//
//  File.swift
//  pictures
//
//  Created by Nelson Dominguez on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailDataManager: NSObject {
    
    var coreDataStore : CoreDataStore?
    
    func findDetailPhoto(photo: Double, completion: ((PictureDataModel?) -> Void)!) {
        
        let predicate = NSPredicate(format: "id == %lf", photo)
        coreDataStore?.fetchPicturesEntriesWithPredicate(predicate, sortDescriptors: nil, completionBlock: { (pictures: [PictureDataModel]) -> Void in
            if let picture = pictures.first {
                completion(picture)
            }
        })
    }
}