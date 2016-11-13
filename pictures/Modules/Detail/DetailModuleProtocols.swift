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
    
    var detailPresenter : DetailPresenterProtocol? { get set }
    var photo: Double? { get set }
    
    func showNotFoundMessage()
    func showDetailPicture(detailModel: DetailModel)
}

protocol DetailPresenterProtocol: class {
    
    var wireFrame : DetailWireFrameProtocol? { get set }
    var interactor : DetailInteractorInputProtocol? { get set }
    var view : DetailViewProtocol? { get set }
    
    func loadDetailFromIdentifier(identifier: Double)
}

protocol DetailDataManagerProtocol: class {
    
    var persistenceLayer : PersistenceLayerProtocol? { get set }
    
    func findDetailPhoto(identifier: Double, completion: @escaping (PictureModel?) -> ())
}

protocol DetailInteractorInputProtocol: class {
    
    var output : DetailInteractorOutputProtocol? { get set }
    var dataManager : DetailDataManagerProtocol? { get set }
    
    func findDetailPhoto(identifier: Double)
}

protocol DetailInteractorOutputProtocol: class {
    
    func foundDetailPhoto(detailModel: DetailModel?)
}
