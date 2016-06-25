//
//  PictureDataModel+CoreDataProperties.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PictureDataModel {

    @NSManaged var camera: String?
    @NSManaged var detailText: String?
    @NSManaged var id: NSNumber?
    @NSManaged var image: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var name: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var userImage: String?
    @NSManaged var userName: String?

}
