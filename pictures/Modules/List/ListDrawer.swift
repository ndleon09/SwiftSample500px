//
//  ListDrawer.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ListDrawer: DrawerProtocol {
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "PhotoCellIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = ListTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    func draw(cell: UITableViewCell, withItem item: ItemProtocol) {
        
        let pictureCell = cell as! ListTableViewCell
        let listItem = item as! ListItem
        
        pictureCell.nameLabel?.text = listItem.model.imageName
        pictureCell.ratingLabel?.text = String(listItem.model.rating!)
        
        guard let url = listItem.model.imageURL else {
            return
        }
        
        pictureCell.pictureImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
    }
}
