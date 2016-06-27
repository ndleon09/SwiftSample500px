//
//  DetailItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 27/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailLocationItem: ItemProtocol {
    
    var drawer: DrawerProtocol = DetailLocationDrawer()
    
    var latitude: Double
    var longitude: Double
    var height: Float
    
    init(latitude: Double, longitude: Double) {
        
        self.latitude = latitude
        self.longitude = longitude
        self.height = 320
    }
}