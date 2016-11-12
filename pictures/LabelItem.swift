//
//  LabelItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 12/11/2016.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import TableViewKit
import AlamofireImage

class LabelItem: Item {
    
    var drawer: CellDrawer.Type = LabelDrawer.self
    var height: Height? = Height.static(60.0)
    
    var image: URL?
    var title: String?
    var subtitle: String?
    
    init(image: URL?, title: String?, subtitle: String?) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}

class LabelDrawer: CellDrawer {
    
    static var type: CellType = CellType.nib(UINib(nibName: String(describing: LabelCell.self), bundle: nil), LabelCell.self)
    
    static func draw(_ cell: UITableViewCell, with item: Any) {
        
        let item = item as! LabelItem
        let cell = cell as! LabelCell
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        
        if let imageURL = item.image {
            let size = CGSize(width: 60, height: 60)
            let placeholder = UIImage(named: "unknown_user")?.af_imageScaled(to: size).af_imageRoundedIntoCircle()
            let composite = DynamicCompositeImageFilter([AspectScaledToFillSizeFilter(size: size), CircleFilter()])
            cell.imageView?.af_setImage(withURL: imageURL, placeholderImage: placeholder, filter: composite, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
        } else {
            cell.imageView?.image = nil
        }
    }
}

class LabelCell: UITableViewCell { }
