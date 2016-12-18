//
//  DetailItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 27/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import TableViewKit

class LocationItem: Item {
    
    var drawer: CellDrawer.Type = LocationDrawer.self
    var height: Height? = Height.static(320.0)
    
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class LocationDrawer: CellDrawer {
    
    static var type: CellType = CellType.nib(UINib(nibName: String(describing: LocationCell.self), bundle: nil), LocationCell.self)
    
    static func draw(_ cell: UITableViewCell, with item: Any) {
        
        let item = item as! LocationItem
        let cell = cell as! LocationCell
        
        cell.setLocation(latitude: item.latitude, longitude: item.longitude)
    }
}
