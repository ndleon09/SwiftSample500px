//
//  DetailInteractor.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInput {

    var detailPresenter : DetailInteractorOutput!
    var detailDataManager : DetailDataManager!
    
    func findDetailPhoto(identifier: Double) {
        
        detailDataManager.findDetailPhoto(identifier, completion: { picture in
            
            let detailModel = self.detailModelFromPictureDataModel(picture)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.detailPresenter.foundDetailPhoto(detailModel)
            })
        })
    }
    
    func detailModelFromPictureDataModel(pictureDataModel: PictureDataModel?) -> DetailModel? {
        
        if let dataModel = pictureDataModel {
            
            let detailModel = DetailModel()
            detailModel.name = dataModel.name
            detailModel.camera = dataModel.camera
            detailModel.descriptionText = dataModel.detailText
            detailModel.userName = dataModel.userName
            detailModel.userImage = NSURL(string: dataModel.userImage!)
            detailModel.latitude = dataModel.latitude?.doubleValue
            detailModel.longitude = dataModel.longitude?.doubleValue
            
            return detailModel
        }
        return nil
    }
}
