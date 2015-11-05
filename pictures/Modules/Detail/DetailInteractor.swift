//
//  DetailInteractor.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailInteractor: NSObject, DetailInteractorInput {

    var detailPresenter : DetailInteractorOutput?
    var detailDataManager : DetailDataManager?
    
    func findDetailPhoto(identifier: Double) {
        
        detailDataManager?.findDetailPhoto(identifier, completion: { (picture: PictureDataModel?) -> Void in
            let detailModel = self.detailModelFromPictureDataModel(picture)
            self.detailPresenter?.foundDetailPhoto(detailModel)
        })
    }
    
    func detailModelFromPictureDataModel(pictureDataModel: PictureDataModel?) -> DetailModel? {
        
        if let dataModel = pictureDataModel {
            
            let detailModel = DetailModel()
            detailModel.name = dataModel.name
            detailModel.camera = dataModel.camera
            detailModel.descriptionText = dataModel.detailText
            detailModel.latitude = dataModel.latitude
            detailModel.longitude = dataModel.longitude
            
            return detailModel
        }
        return nil
    }
}
