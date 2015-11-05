//
//  DetailPresenter.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject {

    var detailWireFrame : DetailWireFrame?
    var detailInteractor : DetailInteractor?
    var detailView : DetailViewInterface?
    
    func loadDetailFromIdentifier(identifier: Double) {
        detailView?.showLoadingIndicator()
    }
}
