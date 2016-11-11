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

    fileprivate var mapView: MKMapView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.tag = 1
        contentView.addSubview(mapView)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let mapViewCenterX = NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let mapViewCenterY = NSLayoutConstraint(item: mapView, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let mapViewWidth = NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.contentView.frame.size.height - 20)
        let mapViewHeight = NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: mapViewWidth.constant)
        
        contentView.addConstraint(mapViewCenterX)
        contentView.addConstraint(mapViewCenterY)
        contentView.addConstraint(mapViewWidth)
        contentView.addConstraint(mapViewHeight)
    }
    
    func setLocation(_ latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.centerCoordinate = annotation.coordinate
        mapView.addAnnotation(annotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
