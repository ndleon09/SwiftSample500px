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
    
    func presentListModule(window : UIWindow)
    func showPhotoDetail(identifier: Double)
}

// ListViewController
protocol ListViewInterfaceProtocol: class {
    
    var listPresenter : ListPresenterProtocol? { get }
    
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
    
    var networkService : NetworkingService? { get }
    var persistenceLayer : PersistenceLayerProtocol? { get }
    
    func findMostPopularPictures(completion: @escaping ([PictureModel]) -> ())
}
