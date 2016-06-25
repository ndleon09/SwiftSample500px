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
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "PhotoCellIdentifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = ListTableViewCell(style: .Default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    func draw(cell cell: UITableViewCell, withItem item: ItemProtocol) {
        
        let pictureCell = cell as! ListTableViewCell
        let listItem = item as! ListItem
        
        pictureCell.pictureImageView?.af_setImageWithURL(listItem.model.imageURL!, placeholderImage: UIImage(named: "placeholder"), filter: nil, imageTransition: .CrossDissolve(0.4))
        pictureCell.nameLabel?.text = listItem.model.imageName
        pictureCell.ratingLabel?.text = String(listItem.model.rating!)
    }
}