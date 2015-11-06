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
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.detailPresenter?.foundDetailPhoto(detailModel)
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
            detailModel.userImage = NSURL(string: dataModel.userImage)
            detailModel.latitude = dataModel.latitude
            detailModel.longitude = dataModel.longitude
            
            return detailModel
        }
        return nil
    }
}
