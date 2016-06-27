//
//  DetailWireFrame.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    func presentDetailModuleInNavigationController(navigationController: UINavigationController, photo: Double) {
        
        let detailPresenter = DetailPresenter()
        let detailInteractor = DetailInteractor()
        let detailDataManager = DetailDataManager()
        let coreDataManager = CoreDataStore()
        let viewController = DetailViewController()
        
        detailDataManager.coreDataStore = coreDataManager
        
        detailInteractor.detailPresenter = detailPresenter
        detailInteractor.detailDataManager = detailDataManager
        
        detailPresenter.detailWireFrame = self
        detailPresenter.detailInteractor = detailInteractor
        detailPresenter.detailView = viewController
        detailPresenter.loadDetailFromIdentifier(photo)
        
        viewController.detailPresenter = detailPresenter
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
