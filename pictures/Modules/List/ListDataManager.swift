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
    
    func findMostPopularPictures(completion: @escaping ([PictureModel]) -> ()) {
        
        findMostPopularPicturesInLocal(completion: completion)
        findMostPopularPicturesInNetwork(completion: completion)
    }
    
    fileprivate func findMostPopularPicturesInNetwork(completion: @escaping ([PictureModel]) -> ()) {
        
        networkService?.findMostPopularPictures { photos in
            
            var pictureModels = [PictureModel]()
            for photoDictionary in photos {
                let photo = PictureModel(dictionary: photoDictionary as! NSDictionary)
                pictureModels.append(photo)
            }
            
            self.saveMostPopularPictures(pictures: pictureModels)
            self.findMostPopularPicturesInLocal(completion: completion)
        }
    }
    
    fileprivate func findMostPopularPicturesInLocal(completion: @escaping ([PictureModel]) -> ()) {
        
        let sortDescriptor = NSSortDescriptor(key: "rating", ascending: false)
        persistenceLayer?.fetchPicturesEntries(predicate: nil, sortDescriptors: [sortDescriptor], completionBlock: { objects in
            
            var pictureModels: [PictureModel] = []
            for object in objects {
                
                let keys = Array(object.entity.attributesByName.keys)
                let dictionary = object.dictionaryWithValues(forKeys: keys)
                let picture = PictureModel(coreDataDictionary: dictionary)
                pictureModels.append(picture)
            }
            
            DispatchQueue.main.async(execute: {
                completion(pictureModels)
            })
        })
    }
    
    fileprivate func saveMostPopularPictures(pictures: [PictureModel]) {
        
        for picture in pictures {
            
            persistenceLayer?.findPicture(id: picture.id!, completion: { object in
                
                if object == nil {
                    
                    let pictureDataModel = self.persistenceLayer?.newPictureDataModel()
                    pictureDataModel?.id = picture.id as NSNumber?
                    pictureDataModel?.name = picture.name
                    pictureDataModel?.image = picture.image
                    pictureDataModel?.detailText = picture.detailText
                    pictureDataModel?.userName = picture.user?.name
                    pictureDataModel?.userImage = picture.user?.image
                    pictureDataModel?.rating = picture.rating as NSNumber?
                    pictureDataModel?.camera = picture.camera
                    pictureDataModel?.latitude = picture.latitude as NSNumber?
                    pictureDataModel?.longitude = picture.longitude as NSNumber?
                    
                    self.persistenceLayer?.save()
                }
            })
        }
    }
}
