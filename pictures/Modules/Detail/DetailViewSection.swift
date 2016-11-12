//
//  DetailViewSection.swift
//  pictures
//
//  Created by Nelson Dominguez on 12/11/2016.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import TableViewKit

class DetailViewSection: Section {
    
    var items: ObservableArray<Item> = []
    
    init(model: DetailModel) {
        
        let userItem = LabelItem(image: model.userImage, title: model.userName, subtitle: nil)
        items.append(userItem)
        
        let nameItem = LabelItem(image: nil, title: "Title", subtitle: model.name)
        items.append(nameItem)
        
        if let description = model.descriptionText {
            let descriptionItem = LabelItem(image: nil, title: "Description", subtitle: description)
            items.append(descriptionItem)
        }
        
        if let camera = model.camera {
            let cameraItem = LabelItem(image: nil, title: "Camera", subtitle: camera)
            items.append(cameraItem)
        }
        
        if let latitude = model.latitude, let longitude = model.longitude {
            let locationItem = LocationItem(latitude: latitude, longitude: longitude)
            items.append(locationItem)
        }
    }
}
