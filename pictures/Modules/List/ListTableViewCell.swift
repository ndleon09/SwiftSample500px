//
//  ListTableViewCell.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ListTableViewCell: UITableViewCell {
    
    var pictureImageView : UIImageView?
    var nameLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.pictureImageView = UIImageView()
        self.contentView.addSubview(self.pictureImageView!)
        
        self.nameLabel = UILabel()
        self.contentView.addSubview(self.nameLabel!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCellFromListModel(listModel: ListModel) {
        self.nameLabel?.text = listModel.imageName
        Alamofire.request(.GET, listModel.imageURL!).responseImage { response in
            if let image = response.result.value {
                self.pictureImageView?.image = image
            }
        }
    }
}
