//
//  DetailWireFrame.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    func presentDetailModule(in navigationController: UINavigationController, photo: Double) {
        
        let detailPresenter = DetailPresenter()
        let detailInteractor = DetailInteractor()
        let detailDataManager = DetailDataManager()
        let persistenceLayer = PersistenceLayer()
        let viewController = DetailViewController()
        
        detailDataManager.persistenceLayer = persistenceLayer
        
        detailInteractor.output = detailPresenter
        detailInteractor.dataManager = detailDataManager
        
        detailPresenter.wireFrame = self
        detailPresenter.interactor = detailInteractor
        detailPresenter.view = viewController
        detailPresenter.loadDetailFromIdentifier(identifier: photo)
        
        viewController.detailPresenter = detailPresenter
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
