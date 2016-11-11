//
//  ListPresenter.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListPresenter: ListInteractorOutputProtocol {

    var listInteractor : ListInteractorInputProtocol?
    var listWireFrame : ListWireFrameProtocol?
    weak var listView : ListViewInterfaceProtocol?
    
    func updateView() {
        listView?.showLoadingIndicator()
        listInteractor?.findMostPopularPhotos()
    }
    
    func foundMostPopularPhotos(mostPopularPhotos: [PictureModel]) {
        
        listView?.hideLoadingIndicator()
        
        if mostPopularPhotos.count == 0 {
            listView?.showNoContentMessage()
        }
        else {
            listView?.showMostPopularPhotos(photos: convert(picturesModel: mostPopularPhotos))
        }
    }
    
    func showPhotoDetail(identifier: Double) {
        listWireFrame?.showPhotoDetail(identifier: identifier)
    }
    
    fileprivate func convert(picturesModel: [PictureModel]) -> [ListModel] {
        
        var listModels: [ListModel] = []
        
        for picture in picturesModel {
            
            let model = ListModel(id: picture.id, imageURL: URL(string: picture.image!), imageName: picture.name, rating: picture.rating)
            listModels.append(model)
        }
        
        return listModels
    }
}
