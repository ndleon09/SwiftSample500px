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
        
        let presenter: DetailPresenterProtocol? = BasicServiceLocator.shared.getService()
        let interactor: DetailInteractorInputProtocol? = BasicServiceLocator.shared.getService()
        let dataManager: DetailDataManagerProtocol? = BasicServiceLocator.shared.getService()
        let persistenceLayer: PersistenceLayerProtocol? = BasicServiceLocator.shared.getService()
        
        let view: DetailViewProtocol? = BasicServiceLocator.shared.getService()
        view?.detailPresenter = presenter
        
        dataManager?.persistenceLayer = persistenceLayer
        
        interactor?.output = BasicServiceLocator.shared.getService()
        interactor?.dataManager = dataManager
        
        presenter?.wireFrame = self
        presenter?.interactor = interactor
        presenter?.view = view
        presenter?.loadDetailFromIdentifier(identifier: photo)
        
        guard let viewController = view as? UIViewController else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
}
