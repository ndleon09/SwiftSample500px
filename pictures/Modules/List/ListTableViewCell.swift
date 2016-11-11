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
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        pictureImageView = UIImageView(frame: CGRect.zero)
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pictureImageView)
        
        ratingLabel = UILabel(frame: CGRect.zero)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 12)
        ratingLabel.textColor = UIColor.white
        contentView.addSubview(ratingLabel)
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blurView)
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 14.0)
        nameLabel.numberOfLines = 1
        blurView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pictureImageViewCenterX = NSLayoutConstraint(item: self.pictureImageView!, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let pictureImageViewCenterY = NSLayoutConstraint(item: self.pictureImageView!, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let pictureImageViewHeight = NSLayoutConstraint(item: self.pictureImageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.frame.height - 10)
        let pictureImageViewWidth = NSLayoutConstraint(item: self.pictureImageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: pictureImageViewHeight.constant)
        
        let ratingLabelTop = NSLayoutConstraint(item: self.ratingLabel!, attribute: .top, relatedBy: .equal, toItem: self.pictureImageView!, attribute: .top, multiplier: 1.0, constant: 8.0)
        let ratingLabelTrailing = NSLayoutConstraint(item: self.ratingLabel!, attribute: .trailing, relatedBy: .equal, toItem: self.pictureImageView!, attribute: .trailing, multiplier: 1.0, constant: -8.0)
        
        let blurViewLeading = NSLayoutConstraint(item: self.blurView!, attribute: .leading, relatedBy: .equal, toItem: self.pictureImageView!, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let blurViewTrailing = NSLayoutConstraint(item: self.blurView!, attribute: .trailing, relatedBy: .equal, toItem: self.pictureImageView!, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let blurViewHeight = NSLayoutConstraint(item: self.blurView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0)
        let blurViewBottom = NSLayoutConstraint(item: self.blurView!, attribute: .bottom, relatedBy: .equal, toItem: self.pictureImageView!, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let nameLabelCenterY = NSLayoutConstraint(item: self.nameLabel!, attribute: .centerY, relatedBy: .equal, toItem: self.blurView!, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let nameLabelLeading = NSLayoutConstraint(item: self.nameLabel!, attribute: .leading, relatedBy: .equal, toItem: self.blurView!, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let nameLabelTrailing = NSLayoutConstraint(item: self.nameLabel!, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self.blurView!, attribute: .trailing, multiplier: 1.0, constant: -10.0)
        
        self.contentView.addConstraints([pictureImageViewCenterX, pictureImageViewCenterY, pictureImageViewWidth, pictureImageViewHeight])
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
