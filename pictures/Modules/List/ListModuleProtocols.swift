//
//  ListModuleProtocols.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol ListViewInterface {
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNoContentMessage()
    func showMostPopularPhotos(photos: [ListModel])
}

protocol ListInteractorInput {
    
    func findMostPopularPhotos()
}

protocol ListInteractorOutput {
    
    func foundMostPopularPhotos(mostPopularPhotos : [PictureModel])
}