//
//  DetailLocationCell.swift
//  pictures
//
//  Created by Nelson on 06/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import MapKit
import LayoutKit

class MapLayout: SizeLayout<MKMapView> {
    
    convenience init(centerCoordinate: CLLocationCoordinate2D, mapWidth: CGFloat) {
        
        self.init(width: mapWidth, height: mapWidth, alignment: .center,
            config: { mapView in
                mapView.isZoomEnabled = false
                mapView.isScrollEnabled = false
                mapView.centerCoordinate = centerCoordinate
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = centerCoordinate
                mapView.addAnnotation(annotation)
            }
        )
    }
}

class LocationCell: UITableViewCell {
    
    func setLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let mapLayout = MapLayout(centerCoordinate: centerCoordinate , mapWidth: contentView.bounds.width)
        
        contentView.addSubview(mapLayout.arrangement().makeViews())
    }
}
