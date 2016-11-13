//
//  DetailWireFrame.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    let container: ServiceLocator
    
    init(container: ServiceLocator) {
        self.container = container
    }
    
    func presentDetailModule(in navigationController: UINavigationController, photo: Double) {
        
        let view: DetailViewProtocol? = container.getService()
        view?.photo = photo
        
        guard let viewController = view as? UIViewController else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
}
