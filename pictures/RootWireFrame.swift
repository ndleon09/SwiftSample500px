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
    
    func installRootViewControllerIntoWindow(_ window : UIWindow) {
        
        let listWireFrame = ListWireFrame()
        listWireFrame.rootWireFrame = self
        listWireFrame.presentListModule(window: window)
    }

    func showRootViewController(_ rootViewController : UIViewController, inWindow : UIWindow) {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        inWindow.backgroundColor = UIColor.white
        inWindow.rootViewController = navigationController
        inWindow.makeKeyAndVisible()
        
        self.rootViewController = navigationController
    }
}
