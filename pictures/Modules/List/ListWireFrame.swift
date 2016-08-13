//
//  ListWireFrame.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListWireFrame: ListWireFrameProtocol {
    
    var rootWireFrame: RootWireFrame?
    
    func presentListModuleFromWindow(window : UIWindow) {
        
        let networkService = NetworkingServiceImp()
        let persistenceLayer = PersistenceLayer()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor()
        
        let viewController = ListViewController()
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireFrame = self
        listPresenter.listView = viewController
        
        listDataManager.networkService = networkService
        listDataManager.persistenceLayer = persistenceLayer
        
        listInteractor.dataManager = listDataManager
        listInteractor.output = listPresenter
        
        viewController.listPresenter = listPresenter
        
        rootWireFrame?.showRootViewController(viewController, inWindow: window)
    }
    
    func showPhotoDetailFromIdentifier(photo: Double) {
        
        if let rootViewController = rootWireFrame?.rootViewController {
            
            let detailWireFrame = DetailWireFrame()
            detailWireFrame.presentDetailModuleInNavigationController(rootViewController, photo: photo)
        }
    }
}
