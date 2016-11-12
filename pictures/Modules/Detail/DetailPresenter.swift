//
//  DetailPresenter.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    var wireFrame: DetailWireFrameProtocol?
    var interactor: DetailInteractorInputProtocol?
    var view: DetailViewProtocol?
    
    func loadDetailFromIdentifier(identifier: Double) {
        interactor?.findDetailPhoto(identifier: identifier)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
    func foundDetailPhoto(detailModel: DetailModel?) {
        
        if let model = detailModel {
            view?.showDetailPicture(detailModel: model)
        }
        else {
            view?.showNotFoundMessage()
        }
    }
}
