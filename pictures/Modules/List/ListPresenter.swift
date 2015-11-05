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
    var listView : ListViewInterface?
    
    func updateView() {
        listView?.showLoadingIndicator()
        listInteractor?.findMostPopularPhotos()
    }
    
    func foundMostPopularPhotos(mostPopularPhotos: [ListModel]?) {
        
        listView?.hideLoadingIndicator()
        
        if mostPopularPhotos == nil {
            listView?.showNoContentMessage()
        }
        else {
            listView?.showMostPopularPhotos(mostPopularPhotos)
        }
    }
}
