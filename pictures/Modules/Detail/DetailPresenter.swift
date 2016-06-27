//
//  DetailPresenter.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailPresenter: DetailInteractorOutputProtocol {

    var detailWireFrame : DetailWireFrameProtocol!
    var detailInteractor : DetailInteractorInputProtocol!
    var detailView : DetailViewProtocol!
    
    func loadDetailFromIdentifier(identifier: Double) {
        
        detailInteractor.findDetailPhoto(identifier)
    }
    
    func foundDetailPhoto(detailModel: DetailModel?) {
        
        if let model = detailModel {
            detailView.showDetailPicture(model)
        }
        else {
            detailView.showNotFoundMessage()
        }
    }
}
