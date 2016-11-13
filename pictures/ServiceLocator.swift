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

class Container: ServiceLocator {
    
    fileprivate lazy var registry: Dictionary<String, Any> = [:]
    
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
