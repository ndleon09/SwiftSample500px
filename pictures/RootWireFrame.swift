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
    
    var rootViewController: UINavigationController!
    
    func installRootViewControllerIntoWindow(window : UIWindow) {
        
        let listWireFrame = ListWireFrame()
        listWireFrame.rootWireFrame = self
        listWireFrame.presentListModuleFromWindow(window)
    }

    func showRootViewController(rootViewController : UIViewController, inWindow : UIWindow) {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        inWindow.backgroundColor = UIColor.whiteColor()
        inWindow.rootViewController = navigationController
        inWindow.makeKeyAndVisible()
        
        self.rootViewController = navigationController
    }
}
