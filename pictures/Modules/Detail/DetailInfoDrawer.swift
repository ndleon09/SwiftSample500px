//
//  DetailInfoDrawer.swift
//  pictures
//
//  Created by Nelson Dominguez on 27/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class DetailInfoDrawer: DrawerProtocol {
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DetailInfoCellIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = DetailInfoCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        return cell!
    }
    
    func draw(cell cell: UITableViewCell, withItem item: ItemProtocol) {
        
        let infoItem = item as! DetailInfoItem
        let infoCell = cell as! DetailInfoCell
        
        infoCell.selectionStyle = .None
        infoCell.imageView?.image = nil
        infoCell.textLabel?.text = infoItem.title
        infoCell.detailTextLabel?.numberOfLines = 3
        infoCell.detailTextLabel?.text = infoItem.subtitle
        
        if let imageURL = infoItem.image {
            let placeholder = UIImage(named: "unknown_user")?.af_imageScaledToSize(CGSize(width: 60, height: 60)).af_imageRoundedIntoCircle()
            let composite = DynamicCompositeImageFilter([AspectScaledToFillSizeFilter(size: CGSize(width: 60, height: 60)), CircleFilter()])
            infoCell.imageView?.af_setImageWithURL(imageURL, placeholderImage: placeholder, filter: composite, imageTransition: .CrossDissolve(0.5))
        }
    }
}