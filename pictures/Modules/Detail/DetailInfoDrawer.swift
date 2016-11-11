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
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DetailInfoCellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = DetailInfoCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        return cell!
    }
    
    func draw(cell: UITableViewCell, withItem item: ItemProtocol) {
        
        let infoItem = item as! DetailInfoItem
        let infoCell = cell as! DetailInfoCell
        
        infoCell.selectionStyle = .none
        infoCell.imageView?.image = nil
        infoCell.textLabel?.text = infoItem.title
        infoCell.detailTextLabel?.numberOfLines = 3
        infoCell.detailTextLabel?.text = infoItem.subtitle
        
        guard let imageURL = infoItem.image else { return }
        
        let placeholder = UIImage(named: "unknown_user")?.af_imageScaled(to: CGSize(width: 60, height: 60)).af_imageRoundedIntoCircle()
        let composite = DynamicCompositeImageFilter([AspectScaledToFillSizeFilter(size: CGSize(width: 60, height: 60)), CircleFilter()])
        infoCell.imageView?.af_setImage(withURL: imageURL, placeholderImage: placeholder, filter: composite, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
    }
}
