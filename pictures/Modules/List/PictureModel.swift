//
//  PictureModel.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class UserModel {
    
    let image : String?
    let name : String?
    
    init(image: String?, name: String?) {
        self.image = image
        self.name = name
    }
}

class PictureModel: NSObject {

    var image : String?
    var name : String?
    var detailText : String?
    var rating : Double?
    var user : UserModel?
    var camera : String?
    var latitude : Double?
    var longitude : Double?
    
    override init() {
        
    }
    
    convenience init(dictionary: NSDictionary) {
        
        self.init()
        
        self.image = dictionary["image_url"] as? String
        self.name = dictionary["name"] as? String
        self.detailText = dictionary["description"] as? String
        self.rating = dictionary["rating"] as? Double
        self.camera = dictionary["camera"] as? String
        self.latitude = dictionary["latitude"] as? Double
        self.longitude = dictionary["longitude"] as? Double
        
        let userName = dictionary.valueForKeyPath("user.fullname") as? String
        let userImageName = dictionary.valueForKeyPath("user.avatars.small.https") as? String
        self.user = UserModel(image: userImageName, name: userName)
    }
}
