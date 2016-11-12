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
    
    func presentListModule(window : UIWindow) {
        
        let presenter: ListPresenterProtocol? = BasicServiceLocator.shared.getService()
        let interactor: ListInteractorInputProtocol? = BasicServiceLocator.shared.getService()
        
        let dataManager: ListDataManagerProtocol? = BasicServiceLocator.shared.getService()
        dataManager?.networkService = BasicServiceLocator.shared.getService()
        dataManager?.persistenceLayer = BasicServiceLocator.shared.getService()
        
        let view: ListViewInterfaceProtocol? = BasicServiceLocator.shared.getService()
        view?.listPresenter = presenter
        
        presenter?.listInteractor = interactor
        presenter?.listWireFrame = self
        presenter?.listView = view
        
        interactor?.dataManager = dataManager
        interactor?.output = BasicServiceLocator.shared.getService()
        
        guard let viewController = view as? UIViewController else { return }
        rootWireFrame?.show(rootViewController: viewController, inWindow: window)
    }
    
    func showPhotoDetail(identifier: Double) {
        
        if let rootViewController = rootWireFrame?.rootViewController {
            
            let detailWireFrame = DetailWireFrame()
            detailWireFrame.presentDetailModule(in: rootViewController, photo: identifier)
        }
    }
}
