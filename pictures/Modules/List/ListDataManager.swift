//
//  ListDataManager.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListDataManager {

    var networkService : NetworkingService!
    var coreDataStore : CoreDataStore!
    
    func findMostPopularPictures(completion: ([PictureModel]) -> ()) {
        
        networkService.findMostPopularPictures { photos in
            
            var pictureModels : [PictureModel] = []
            
            for photoDictionary in photos {
                
                let photo = PictureModel(dictionary: photoDictionary as! NSDictionary)
                pictureModels.append(photo)
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                completion(pictureModels)
            })
            
            self.saveMostPopularPictures(pictureModels)
        }
    }
    
    func saveMostPopularPictures(pictures: [PictureModel]) {
        
        for picture in pictures {
            
            coreDataStore.findPicture(picture.id!, completion: { object in
                
                if object == nil {
                    
                    let pictureDataModel = self.coreDataStore.newPictureDataModel()
                    pictureDataModel.id = picture.id
                    pictureDataModel.name = picture.name
                    pictureDataModel.image = picture.image
                    pictureDataModel.detailText = picture.detailText
                    pictureDataModel.userName = picture.user?.name
                    pictureDataModel.userImage = picture.user?.image
                    pictureDataModel.rating = picture.rating
                    pictureDataModel.camera = picture.camera
                    pictureDataModel.latitude = picture.latitude
                    pictureDataModel.longitude = picture.longitude
                }
            })
        }
        
        coreDataStore.save()
    }
}
