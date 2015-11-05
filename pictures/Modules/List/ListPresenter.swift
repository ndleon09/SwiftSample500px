//
//  ListPresenter.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListInteractorOutput {

    var listInteractor : ListInteractorInput?
    var listWireFrame : ListWireFrame?
    var userInterface : ListViewInterface?
    
    func updateView() {
        userInterface?.showLoadingIndicator()
        listInteractor?.findMostPopularPhotos()
    }
    
    func foundMostPopularPhotos(mostPopularPhotos: NSArray?) {
        
        userInterface?.hideLoadingIndicator()
        
        if mostPopularPhotos == nil {
            userInterface?.showNoContentMessage()
        }
        else {
            userInterface?.showMostPopularPhotos(mostPopularPhotos)
        }
    }
}
