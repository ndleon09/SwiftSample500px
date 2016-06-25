//
//  ListInteractor.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInput {

    let dataManager : ListDataManager!
    var output : ListInteractorOutput!
    
    init(dataManager: ListDataManager) {
        
        self.dataManager = dataManager
    }
    
    func findMostPopularPhotos() {
        
        dataManager.findMostPopularPictures { photos in
            
            self.output.foundMostPopularPhotos(photos)
        }
    }
}
