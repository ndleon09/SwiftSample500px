//
//  DetailInteractorInterfaces.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol DetailInteractorInput {
    func findDetailPhoto(identifier: Double)
}

protocol DetailInteractorOutput {
    func foundDetailPhoto(detailModel: DetailModel?)
}