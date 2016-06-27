//
//  DetailInteractorInterfaces.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol DetailDataManagerProtocol: class {
    
    func findDetailPhoto(identifier: Double, completion: (PictureModel?) -> ())
}

protocol DetailInteractorInputProtocol: class {
    
    func findDetailPhoto(identifier: Double)
}

protocol DetailInteractorOutputProtocol: class {
    
    func foundDetailPhoto(detailModel: DetailModel?)
}