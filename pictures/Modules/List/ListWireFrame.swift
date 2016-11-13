//
//  ListWireFrame.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListWireFrame: ListWireFrameProtocol {
    
    var container: ServiceLocator
    
    init(container: ServiceLocator) {
        self.container = container
    }
    
    func showList(in navigationController: UINavigationController) {
        
        let view: ListViewInterfaceProtocol? = container.getService()
        guard let viewController = view as? UIViewController else { return }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showPhotoDetail(identifier: Double) {
        
        let view: ListViewInterfaceProtocol? = container.getService()
        guard let viewController = view as? UIViewController, let navigationController = viewController.navigationController else { return }
        
        let detailWireFrame = DetailWireFrame(container: container)
        detailWireFrame.presentDetailModule(in: navigationController, photo: identifier)
    }
}
