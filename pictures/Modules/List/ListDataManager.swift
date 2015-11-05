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
            
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                self.saveMostPopularPictures(pictureModels)
            }
        })
    }
    
    func saveMostPopularPictures(pictures: [PictureModel]) {
        
        for picture in pictures {
            
            let predicate = NSPredicate(format: "id == %lf", picture.id!)
            
            coreDataStore?.fetchPicturesEntriesWithPredicate(predicate, sortDescriptors: nil, completionBlock: { (picturesDataModels:[PictureDataModel]) -> Void in
                
                if picturesDataModels.count == 0 {
                    
                    let pictureDataModel = self.coreDataStore?.newPictureDataModel()
                    
                    if let id = picture.id {
                        pictureDataModel?.id = id
                    }
                    if let name = picture.name {
                        pictureDataModel?.name = name
                    }
                    if let image = picture.image {
                        pictureDataModel?.image = image
                    }
                    if let detailText = picture.detailText {
                        pictureDataModel?.detailText = detailText
                    }
                    if let rating = picture.rating {
                        pictureDataModel?.rating = rating
                    }
                    if let camera = picture.camera {
                        pictureDataModel?.camera = camera
                    }
                    if let latitude = picture.latitude {
                        pictureDataModel?.latitude = latitude
                    }
                    if let longitude = picture.longitude {
                        pictureDataModel?.longitude = longitude
                    }
                    
                    self.coreDataStore?.save()
                }
            })
        }
    }
}
