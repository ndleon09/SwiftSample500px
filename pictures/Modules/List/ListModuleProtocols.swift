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
    
    var rootWireFrame: RootWireFrame? { get set }
    
    func presentListModule(window : UIWindow)
    func showPhotoDetail(identifier: Double)
}

// ListViewController
protocol ListViewInterfaceProtocol: class {
    
    var listPresenter : ListPresenterProtocol? { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNoContentMessage()
    func showMostPopularPhotos(photos: [ListModel])
}

// Interactor
protocol ListInteractorInputProtocol: class {
    
    var dataManager : ListDataManagerProtocol? { get set }
    weak var output : ListInteractorOutputProtocol? { get set }
    
    func findMostPopularPhotos()
}

// Presenter
protocol ListPresenterProtocol: class {
    
    var listInteractor : ListInteractorInputProtocol? { get set }
    var listWireFrame : ListWireFrameProtocol? { get set }
    var listView : ListViewInterfaceProtocol? { get set }
    
    func updateView()
    func showPhotoDetail(identifier: Double)
}

protocol ListInteractorOutputProtocol: class {
    
    func foundMostPopularPhotos(mostPopularPhotos : [PictureModel])
}

// DataManager
protocol ListDataManagerProtocol: class {
    
    var networkService : NetworkingServiceProtocol? { get set }
    var persistenceLayer : PersistenceLayerProtocol? { get set }
    
    func findMostPopularPictures(completion: @escaping ([PictureModel]) -> ())
}
