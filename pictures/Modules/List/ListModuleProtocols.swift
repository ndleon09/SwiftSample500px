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
    
    func presentListModuleFromWindow(window : UIWindow)
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