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
    
    var pictureImageView : UIImageView!
    var ratingLabel : UILabel!
    var nameLabel : UILabel!
    var blurView : UIVisualEffectView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        pictureImageView = UIImageView(frame: CGRectZero)
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pictureImageView)
        
        ratingLabel = UILabel(frame: CGRectZero)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFontOfSize(12)
        ratingLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(ratingLabel)
        
        let blurEffect = UIBlurEffect(style: .Dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blurView)
        
        nameLabel = UILabel(frame: CGRectZero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont.systemFontOfSize(14.0)
        nameLabel.numberOfLines = 1
        blurView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pictureImageViewCenterX = NSLayoutConstraint(item: self.pictureImageView!, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let pictureImageViewCenterY = NSLayoutConstraint(item: self.pictureImageView!, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let pictureImageViewHeight = NSLayoutConstraint(item: self.pictureImageView!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: CGRectGetHeight(self.frame) - 10)
        let pictureImageViewWidth = NSLayoutConstraint(item: self.pictureImageView!, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: pictureImageViewHeight.constant)
        
        let ratingLabelTop = NSLayoutConstraint(item: self.ratingLabel!, attribute: .Top, relatedBy: .Equal, toItem: self.pictureImageView!, attribute: .Top, multiplier: 1.0, constant: 8.0)
        let ratingLabelTrailing = NSLayoutConstraint(item: self.ratingLabel!, attribute: .Trailing, relatedBy: .Equal, toItem: self.pictureImageView!, attribute: .Trailing, multiplier: 1.0, constant: -8.0)
        
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
        self.contentView.addConstraint(ratingLabelTop)
        self.contentView.addConstraint(ratingLabelTrailing)
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
}
