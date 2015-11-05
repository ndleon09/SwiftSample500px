//
//  ListInteractor.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListInteractor: NSObject, ListInteractorInput {

    let dataManager : ListDataManager
    var output : ListInteractorOutput?
    
    init(dataManager: ListDataManager) {
        self.dataManager = dataManager
    }
    
    func findMostPopularPhotos() {
        self.dataManager.findMostPopularPictures { (photos: [PictureModel]?) -> Void in
            let listModels = self.listModelsFromPictureModels(photos)
            self.output?.foundMostPopularPhotos(listModels)
        }
    }
    
    func listModelsFromPictureModels(pictures: [PictureModel]?) -> [ListModel]? {
        var listModels : [ListModel] = []
        for pictureModel in pictures! {
            let listModel = ListModel(image: pictureModel.image, name: pictureModel.name)
            listModels.append(listModel)
        }
        return listModels
    }
}
