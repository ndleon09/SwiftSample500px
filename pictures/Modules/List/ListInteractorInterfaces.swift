//
//  ListInteractorInterfaces.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func findMostPopularPhotos()
}

protocol ListInteractorOutput {
    func foundMostPopularPhotos(mostPopularPhotos : [ListModel]?)
}