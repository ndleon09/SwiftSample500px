//
//  ListDataManager.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListDataManager: NSObject {

    var networkService : NetworkingService?
    var coreDataStore : CoreDataStore?
    
    func findMostPopularPictures(completion: (([PictureModel]?) -> Void)!) {
        self.networkService?.findMostPopularPictures({ (photos: NSArray?) -> Void in
            
            var pictureModels : [PictureModel] = []
            
            for photoDictionary in photos! {
                let photo = PictureModel(dictionary: photoDictionary as! NSDictionary)
                pictureModels.append(photo)
            }
            
            if (completion != nil) {
                completion(pictureModels)
            }
        })
    }
}
