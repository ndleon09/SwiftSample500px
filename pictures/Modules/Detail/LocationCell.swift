//
//  DetailLocationCell.swift
//  pictures
//
//  Created by Nelson on 06/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    
    func setLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.centerCoordinate = centerCoordinate
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = centerCoordinate
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
    }
}
