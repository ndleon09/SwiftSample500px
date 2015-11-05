//
//  ListWireFrame.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListWireFrame: NSObject {

    var rootWireFrame : RootWireFrame?
    var listPresenter : ListPresenter?
    var listViewController : ListViewController?
    
    func presentListInterfaceFromWindow(window : UIWindow) {
        
        let viewController = ListViewController()
        viewController.listPresenter = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireFrame?.showRootViewController(viewController, inWindow: window)
    }
}
