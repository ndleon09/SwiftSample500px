//
//  ListPresenter.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListPresenter: ListInteractorOutput {

    var listInteractor : ListInteractorInput!
    var listWireFrame : ListWireFrame!
    var listView : ListViewInterface!
    
    func updateView() {
        listView.showLoadingIndicator()
        listInteractor.findMostPopularPhotos()
    }
    
    func foundMostPopularPhotos(mostPopularPhotos: [PictureModel]) {
        
        listView.hideLoadingIndicator()
        
        if mostPopularPhotos.count == 0 {
            listView.showNoContentMessage()
        }
        else {
            listView.showMostPopularPhotos(convert(mostPopularPhotos))
        }
    }
    
    func showPhotoDetailFromIdentifier(photo: Double) {
        listWireFrame.showPhotoDetailFromIdentifier(photo)
    }
    
    private func convert(picturesModel: [PictureModel]) -> [ListModel] {
        
        var listModels: [ListModel] = []
        
        for picture in picturesModel {
            
            let model = ListModel(id: picture.id, imageURL: NSURL(string: picture.image!), imageName: picture.name, rating: picture.rating)
            listModels.append(model)
        }
        
        return listModels
    }
}
