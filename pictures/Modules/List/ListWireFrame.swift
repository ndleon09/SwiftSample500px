//
//  ListWireFrame.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListWireFrame: ListWireFrameProtocol {
    
    func presentListModuleFromWindow(window : UIWindow) {
        
        let networkService = NetworkingServiceImp()
        let coreDataStore = CoreDataStore()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor()
        
        let viewController = ListViewController()
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireFrame = self
        listPresenter.listView = viewController
        
        listDataManager.networkService = networkService
        listDataManager.coreDataStore = coreDataStore
        
        listInteractor.dataManager = listDataManager
        listInteractor.output = listPresenter
        
        viewController.listPresenter = listPresenter
        
        RootWireFrame().showRootViewController(viewController, inWindow: window)
    }
    
    func showPhotoDetailFromIdentifier(photo: Double) {
        //detailWireFrame?.presentDetailInterfaceFromViewController((rootWireFrame?.navigationController)!, photo: photo)
    }
}
