//
//  ServiceLocator.swift
//  pictures
//
//  Created by Nelson Dominguez on 12/11/2016.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol ServiceLocator {
    func getService<T>() -> T?
}

class BasicServiceLocator: ServiceLocator {
    
    static let shared: ServiceLocator = BasicServiceLocator()
    
    fileprivate lazy var registry: Dictionary<String, Any> = [:]
    
    init() {
        register()
    }
    
    fileprivate func key(from: Any) -> String {
        return (from is Any.Type) ? "\(from)" : "\(type(of: from))"
    }
    
    func add<T>(service: T) {
        let key = self.key(from: T.self)
        registry[key] = service
    }
    
    func getService<T>() -> T? {
        let key = self.key(from: T.self)
        return registry[key] as? T
    }
}

extension BasicServiceLocator {
    
    func register() {
        // Clear all services
        self.registry.removeAll()
        
        // List
        let listPresenter = ListPresenter()
        
        add(service: ListViewController() as ListViewInterfaceProtocol)
        add(service: ListWireFrame() as ListWireFrameProtocol)
        add(service: listPresenter as ListPresenterProtocol)
        add(service: listPresenter as ListInteractorOutputProtocol)
        add(service: ListInteractor() as ListInteractorInputProtocol)
        add(service: ListDataManager() as ListDataManagerProtocol)
        add(service: NetworkingService() as NetworkingServiceProtocol)
        add(service: PersistenceLayer() as PersistenceLayerProtocol)
        
        // Detail
        let detailPresenter = DetailPresenter()
        
        add(service: DetailViewController() as DetailViewProtocol)
        add(service: detailPresenter as DetailPresenterProtocol)
        add(service: detailPresenter as DetailInteractorOutputProtocol)
        add(service: DetailInteractor() as DetailInteractorInputProtocol)
        add(service: DetailDataManager() as DetailDataManagerProtocol)
    }
}
