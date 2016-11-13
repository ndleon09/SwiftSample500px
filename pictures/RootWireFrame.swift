//
//  RootWireFrame.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

class RootWireFrame {
    
    let container: ServiceLocator
    
    init(container: ServiceLocator) {
        self.container = container
    }
    
    func installRootViewController(in window : UIWindow) {
        
        let navigationController = UINavigationController()
        window.backgroundColor = UIColor.white
        window.rootViewController = navigationController
        
        let listWireFrame: ListWireFrameProtocol? = container.getService()
        listWireFrame?.showList(in: navigationController)
        
        window.makeKeyAndVisible()
    }
}
