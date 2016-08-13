//
//  ListModuleProtocols.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

// Wireframe
protocol ListWireFrameProtocol: class {
    
    var rootWireFrame: RootWireFrame? { get }
    
    func presentListModuleFromWindow(window : UIWindow)
    func showPhotoDetailFromIdentifier(photo: Double)
}

// ListViewController
protocol ListViewInterfaceProtocol: class {
    
    var listPresenter : ListPresenter? { get }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNoContentMessage()
    func showMostPopularPhotos(photos: [ListModel])
}

// Interactor
protocol ListInteractorInputProtocol: class {
    
    var dataManager : ListDataManagerProtocol? { get }
    weak var output : ListInteractorOutputProtocol? { get }
    
    func findMostPopularPhotos()
}

// Presenter
protocol ListInteractorOutputProtocol: class {
    
    weak var listView: ListViewInterfaceProtocol? { get }
    var listWireFrame: ListWireFrameProtocol? { get }
    var listInteractor: ListInteractorInputProtocol? { get }
    
    func foundMostPopularPhotos(mostPopularPhotos : [PictureModel])
}

// DataManager
protocol ListDataManagerProtocol: class {
    
    var networkService : NetworkingService? { get }
    var persistenceLayer : PersistenceLayerProtocol? { get }
    
    func findMostPopularPictures(completion: ([PictureModel]) -> ())
}