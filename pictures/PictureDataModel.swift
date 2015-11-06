//
//  PictureDataModel.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation
import CoreData

class PictureDataModel: NSManagedObject {
    @NSManaged var id : Double
    @NSManaged var image : String
    @NSManaged var name : String
    @NSManaged var detailText : String
    @NSManaged var rating : Double
    @NSManaged var camera : String
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
    @NSManaged var userName : String
    @NSManaged var userImage : String
}