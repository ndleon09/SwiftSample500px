//
//  ListDataManager.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListDataManager: ListDataManagerProtocol {

    var networkService : NetworkingService?
    var persistenceLayer : PersistenceLayerProtocol?
    
    func findMostPopularPictures(completion: ([PictureModel]) -> ()) {
        
        findMostPopularPicturesInLocal(completion)
        findMostPopularPicturesInNetwork(completion)
    }
    
    private func findMostPopularPicturesInNetwork(completion: ([PictureModel]) -> ()) {
        
        networkService?.findMostPopularPictures { photos in
            
            var pictureModels : [PictureModel] = []
            
            for photoDictionary in photos {
                
                let photo = PictureModel(dictionary: photoDictionary as! NSDictionary)
                pictureModels.append(photo)
            }
            
            self.saveMostPopularPictures(pictureModels)
            self.findMostPopularPicturesInLocal(completion)
        }
    }
    
    private func findMostPopularPicturesInLocal(completion: ([PictureModel]) -> ()) {
        
        let sortDescriptor = NSSortDescriptor(key: "rating", ascending: false)
        persistenceLayer?.fetchPicturesEntriesWithPredicate(nil, sortDescriptors: [sortDescriptor], completionBlock: { objects in
            
            var pictureModels: [PictureModel] = []
            for object in objects {
                
                let keys = Array(object.entity.attributesByName.keys)
                let dictionary = object.dictionaryWithValuesForKeys(keys)
                let picture = PictureModel(coreDataDictionary: dictionary)
                pictureModels.append(picture)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                completion(pictureModels)
            })
        })
    }
    
    private func saveMostPopularPictures(pictures: [PictureModel]) {
        
        for picture in pictures {
            
            persistenceLayer?.findPicture(picture.id!, completion: { object in
                
                if object == nil {
                    
                    let pictureDataModel = self.persistenceLayer?.newPictureDataModel()
                    pictureDataModel?.id = picture.id
                    pictureDataModel?.name = picture.name
                    pictureDataModel?.image = picture.image
                    pictureDataModel?.detailText = picture.detailText
                    pictureDataModel?.userName = picture.user?.name
                    pictureDataModel?.userImage = picture.user?.image
                    pictureDataModel?.rating = picture.rating
                    pictureDataModel?.camera = picture.camera
                    pictureDataModel?.latitude = picture.latitude
                    pictureDataModel?.longitude = picture.longitude
                    
                    self.persistenceLayer?.save()
                }
            })
        }
    }
}
