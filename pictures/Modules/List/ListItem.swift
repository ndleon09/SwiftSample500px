//
//  ListItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

class ListItem: ItemProtocol {
    
    var drawer: DrawerProtocol
    var model: ListModel
    var height: Float
    
    init(model: ListModel) {
        
        self.model = model
        drawer = ListDrawer()
        height = 44.0
    }
}