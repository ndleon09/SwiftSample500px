//
//  ListModuleProtocols.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

protocol ListWireFrameProtocol: class {
    
    var rootWireFrame: RootWireFrame! { get }
    
    func presentListModuleFromWindow(window : UIWindow)
    func showPhotoDetailFromIdentifier(photo: Double)
}

protocol ListViewInterfaceProtocol: class {
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNoContentMessage()
    func showMostPopularPhotos(photos: [ListModel])
}

protocol ListInteractorInputProtocol: class {
    
    func findMostPopularPhotos()
}

protocol ListInteractorOutputProtocol: class {
    
    func foundMostPopularPhotos(mostPopularPhotos : [PictureModel])
}

protocol ListDataManagerProtocol: class {
    
    func findMostPopularPictures(completion: ([PictureModel]) -> ())
}