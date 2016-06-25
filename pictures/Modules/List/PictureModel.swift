//
//  PictureModel.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

struct UserModel {
    
    let image : String?
    let name : String?
}

class PictureModel {

    var id : Double?
    var image : String?
    var name : String?
    var detailText : String?
    var rating : Double?
    var user : UserModel?
    var camera : String?
    var latitude : Double?
    var longitude : Double?
    
    init(dictionary: NSDictionary) {
        
        self.id = dictionary["id"] as? Double
        self.image = dictionary["image_url"] as? String
        self.name = dictionary["name"] as? String
        self.detailText = dictionary["description"] as? String
        self.rating = dictionary["rating"] as? Double
        self.camera = dictionary["camera"] as? String
        self.latitude = dictionary["latitude"] as? Double
        self.longitude = dictionary["longitude"] as? Double
        
        let userName = dictionary.valueForKeyPath("user.fullname") as? String
        let userImageName = dictionary.valueForKeyPath("user.avatars.large.https") as? String
        self.user = UserModel(image: userImageName, name: userName)
    }
    
    init(coreDataDictionary: [String: AnyObject]) {
        
        id = coreDataDictionary["id"] as? Double
        image = coreDataDictionary["image"] as? String
        name = coreDataDictionary["name"] as? String
        detailText = coreDataDictionary["detailText"] as? String
        rating = coreDataDictionary["rating"] as? Double
        camera = coreDataDictionary["camera"] as? String
        latitude = coreDataDictionary["latitude"] as? Double
        longitude = coreDataDictionary["longitude"] as? Double
        
        let userName = coreDataDictionary["userName"] as? String
        let userImage = coreDataDictionary["userImage"] as? String
        user = UserModel(image: userImage, name: userName)
    }
}
