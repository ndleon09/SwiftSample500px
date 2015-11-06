//
//  DetailLocationCell.swift
//  pictures
//
//  Created by Nelson on 06/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import MapKit

class DetailLocationCell: UITableViewCell {

    var mapView: MKMapView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .None
        
        mapView = MKMapView()
        mapView!.translatesAutoresizingMaskIntoConstraints = false
        mapView!.zoomEnabled = false
        mapView!.scrollEnabled = false
        mapView!.tag = 1
        self.contentView.addSubview(mapView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let mapViewCenterX = NSLayoutConstraint(item: mapView!, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let mapViewCenterY = NSLayoutConstraint(item: mapView!, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let mapViewWidth = NSLayoutConstraint(item: mapView!, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.contentView.frame.size.height - 20)
        let mapViewHeight = NSLayoutConstraint(item: mapView!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: mapViewWidth.constant)
        
        self.contentView.addConstraint(mapViewCenterX)
        self.contentView.addConstraint(mapViewCenterY)
        self.contentView.addConstraint(mapViewWidth)
        self.contentView.addConstraint(mapViewHeight)
    }
    
    func setLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView!.centerCoordinate = annotation.coordinate
        mapView!.addAnnotation(annotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
