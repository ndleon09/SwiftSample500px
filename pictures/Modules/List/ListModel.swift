//
//  ListModel.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class ListModel {
    
    let imageURL : NSURL?
    let imageName : String?
    let rating : Double?
    
    init(image: String?, name: String?, rating: Double?) {
        self.imageURL = NSURL(string: image!)
        self.imageName = name
        self.rating = rating
    }
}
