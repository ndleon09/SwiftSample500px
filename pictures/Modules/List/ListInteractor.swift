//
//  ListInteractor.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {

    var dataManager : ListDataManagerProtocol?
    var output : ListInteractorOutputProtocol?
    
    func findMostPopularPhotos() {
        
        dataManager?.findMostPopularPictures { photos in
            self.output?.foundMostPopularPhotos(mostPopularPhotos: photos)
        }
    }
}
