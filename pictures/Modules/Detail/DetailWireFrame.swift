//
//  DetailWireFrame.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailWireFrame: NSObject {

    var detailPresenter : DetailPresenter?
    var presentedNavigationController : UINavigationController?
    
    func presentDetailInterfaceFromViewController(presentedNavigationController: UINavigationController, photo: Double) {
        
        let viewController = DetailViewController()
        viewController.detailPresenter = self.detailPresenter
        
        presentedNavigationController.pushViewController(viewController, animated: true)
        self.presentedNavigationController = presentedNavigationController
        
        self.detailPresenter?.detailView = viewController
        self.detailPresenter?.loadDetailFromIdentifier(photo)
    }
}
