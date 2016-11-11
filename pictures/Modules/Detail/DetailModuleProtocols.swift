//
//  DetailInteractorInterfaces.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

protocol DetailWireFrameProtocol: class {
    
    func presentDetailModule(in navigationController: UINavigationController, photo: Double)
}

protocol DetailViewProtocol: class {
    
    func showNotFoundMessage()
    func showDetailPicture(detailModel: DetailModel)
}

protocol DetailDataManagerProtocol: class {
    
    func findDetailPhoto(identifier: Double, completion: @escaping (PictureModel?) -> ())
}

protocol DetailInteractorInputProtocol: class {
    
    func findDetailPhoto(identifier: Double)
}

protocol DetailInteractorOutputProtocol: class {
    
    func foundDetailPhoto(detailModel: DetailModel?)
}
