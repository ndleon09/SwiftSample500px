//
//  ListModel.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

struct ListModel {
    
    let imageURL : NSURL?
    let imageName : String?
    
    init(image: String?, name: String?) {
        imageURL = NSURL(string: image!)
        imageName = name
    }
}
