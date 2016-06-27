//
//  DetailLocationDrawer.swift
//  pictures
//
//  Created by Nelson Dominguez on 27/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

class DetailLocationDrawer: DrawerProtocol {
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DetailLocationCellIdentifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = DetailLocationCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        return cell!
    }
    
    func draw(cell cell: UITableViewCell, withItem item: ItemProtocol) {
        
        let detailLocationItem = item as! DetailLocationItem
        let detailLocationCell = cell as! DetailLocationCell
        
        detailLocationCell.setLocation(detailLocationItem.latitude, longitude: detailLocationItem.longitude)
    }
}