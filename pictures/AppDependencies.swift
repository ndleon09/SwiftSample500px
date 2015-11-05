//
//  AppDependencies.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class AppDependencies {
    
    var listWireFrame = ListWireFrame()

    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window : UIWindow) {
        listWireFrame.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        
        let networkService = NetworkingService()
        let coreDataStore = CoreDataStore()
        let rootWireFrame = RootWireFrame()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        let detailWireFrame = DetailWireFrame()
        let datailPresenter = DetailPresenter()
        let detailInteractor = DetailInteractor()
        
        listInteractor.output = listPresenter
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireFrame = listWireFrame
        
        listWireFrame.rootWireFrame = rootWireFrame
        listWireFrame.listPresenter = listPresenter
        listWireFrame.detailWireFrame = detailWireFrame
        
        listDataManager.networkService = networkService
        listDataManager.coreDataStore = coreDataStore
        
        detailWireFrame.detailPresenter = datailPresenter
        datailPresenter.detailInteractor = detailInteractor
    }
}
