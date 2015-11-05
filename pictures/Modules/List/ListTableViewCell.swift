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
    var blurView : UIVisualEffectView?
    var request: Alamofire.Request?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.pictureImageView = UIImageView(frame: CGRectZero)
        self.pictureImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.pictureImageView!)
        
        let blurEffect = UIBlurEffect(style: .Dark)
        self.blurView = UIVisualEffectView(effect: blurEffect)
        self.blurView?.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.blurView!)
        
        self.nameLabel = UILabel(frame: CGRectZero)
        self.nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel?.textColor = UIColor.whiteColor()
        self.nameLabel?.font = UIFont.systemFontOfSize(14.0)
        self.blurView?.addSubview(self.nameLabel!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pictureImageViewCenterX = NSLayoutConstraint(item: self.pictureImageView!, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let pictureImageViewCenterY = NSLayoutConstraint(item: self.pictureImageView!, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let pictureImageViewWidth = NSLayoutConstraint(item: self.pictureImageView!, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 300.0)
        let pictureImageViewHeight = NSLayoutConstraint(item: self.pictureImageView!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 300.0)
        
        let blurViewLeading = NSLayoutConstraint(item: self.blurView!, attribute: .Leading, relatedBy: .Equal, toItem: self.pictureImageView!, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let blurViewTrailing = NSLayoutConstraint(item: self.blurView!, attribute: .Trailing, relatedBy: .Equal, toItem: self.pictureImageView!, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        let blurViewHeight = NSLayoutConstraint(item: self.blurView!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0)
        let blurViewBottom = NSLayoutConstraint(item: self.blurView!, attribute: .Bottom, relatedBy: .Equal, toItem: self.pictureImageView!, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        
        let nameLabelCenterY = NSLayoutConstraint(item: self.nameLabel!, attribute: .CenterY, relatedBy: .Equal, toItem: self.blurView!, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let nameLabelLeading = NSLayoutConstraint(item: self.nameLabel!, attribute: .Leading, relatedBy: .Equal, toItem: self.blurView!, attribute: .Leading, multiplier: 1.0, constant: 10.0)
        let nameLabelTrailing = NSLayoutConstraint(item: self.nameLabel!, attribute: .Trailing, relatedBy: .LessThanOrEqual, toItem: self.blurView!, attribute: .Trailing, multiplier: 1.0, constant: -10.0)
        
        self.contentView.addConstraint(pictureImageViewCenterX)
        self.contentView.addConstraint(pictureImageViewCenterY)
        self.contentView.addConstraint(pictureImageViewWidth)
        self.contentView.addConstraint(pictureImageViewHeight)
        self.contentView.addConstraint(blurViewLeading)
        self.contentView.addConstraint(blurViewTrailing)
        self.contentView.addConstraint(blurViewHeight)
        self.contentView.addConstraint(blurViewBottom)
        self.contentView.addConstraint(nameLabelCenterY)
        self.contentView.addConstraint(nameLabelLeading)
        self.contentView.addConstraint(nameLabelTrailing)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel?.text = nil
        self.pictureImageView?.image = nil
        self.request?.cancel()
    }

    func configureCellFromListModel(listModel: ListModel) {
        
        self.nameLabel?.text = listModel.imageName
        
        self.request?.cancel()
        self.request = Alamofire.request(.GET, listModel.imageURL!).responseImage { response in
            if let image = response.result.value {
                self.pictureImageView?.image = image
            }
        }
    }
}
