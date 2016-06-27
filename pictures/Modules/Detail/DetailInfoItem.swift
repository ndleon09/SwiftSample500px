//
//  DetailInfoItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 27/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

class DetailInfoItem: ItemProtocol {
    
    var drawer: DrawerProtocol = DetailInfoDrawer()
    
    var image: NSURL?
    var title: String?
    var subtitle: String?
    var height: Float
    
    init(image: NSURL?, title: String?, subtitle: String?) {
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.height = 44.0
    }
}