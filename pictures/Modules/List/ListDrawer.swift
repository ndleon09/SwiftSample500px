//
//  ListDrawer.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import TableViewKit
import AlamofireImage

class ListDrawer: CellDrawer {
    
    static var type: CellType = CellType.nib(UINib(nibName: String(describing: ListTableViewCell.self), bundle: nil), ListTableViewCell.self)
    
    static func draw(_ cell: UITableViewCell, with item: Any) {
        
        let pictureCell = cell as! ListTableViewCell
        let listItem = item as! ListItem
        
        pictureCell.selectionStyle = .none
        pictureCell.nameLabel?.text = listItem.model.imageName
        pictureCell.ratingLabel?.text = String(listItem.model.rating!)
        
        guard let url = listItem.model.imageURL else {
            return
        }
        
        let placeholder = UIImage(named: "placeholder")
        pictureCell.pictureImageView.af_setImage(withURL: url, placeholderImage: placeholder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
    }
}
