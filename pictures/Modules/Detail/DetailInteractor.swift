//
//  DetailInteractor.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    var output : DetailInteractorOutputProtocol?
    var dataManager : DetailDataManagerProtocol?
    
    func findDetailPhoto(identifier: Double) {
        
        dataManager?.findDetailPhoto(identifier: identifier, completion: { picture in
            
            let detailModel = self.detailModelFromPictureModel(picture)
            self.output?.foundDetailPhoto(detailModel: detailModel)
        })
    }
    
    fileprivate func detailModelFromPictureModel(_ pictureModel: PictureModel?) -> DetailModel? {
        
        if let picture = pictureModel {
            
            let detailModel = DetailModel()
            detailModel.name = picture.name
            detailModel.camera = picture.camera
            detailModel.descriptionText = picture.detailText
            detailModel.latitude = picture.latitude
            detailModel.longitude = picture.longitude
            
            detailModel.userName = picture.user?.name
            if let image = picture.user?.image {
                detailModel.userImage = URL(string: image)
            }
            
            return detailModel
        }
        return nil
    }
}
