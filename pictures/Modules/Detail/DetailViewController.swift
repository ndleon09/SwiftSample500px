//
//  DetailViewController.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

enum DetailViewItems {
    
    case DetailViewItemName, DetailViewItemDescription, DetailViewItemCamera, DetailViewItemUser, DetailViewItemMap
    
    func titleForItem() -> String {
        switch self {
        case .DetailViewItemName:
            return "Name"
        case .DetailViewItemDescription:
            return "Detail text"
        case .DetailViewItemCamera:
            return "Camera"
        case .DetailViewItemUser:
            return "User"
        case .DetailViewItemMap:
            return "Location"
        }
    }
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate, DetailViewInterface {

    var detailPresenter : DetailPresenter?
    var detailModel: DetailModel?
    var items: [DetailViewItems] = []
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView(frame: self.view.frame, style: .Grouped)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.backgroundColor = UIColor.whiteColor()
        self.tableView?.registerClass(DetailLocationCell.self, forCellReuseIdentifier: "LocationCell")
        self.view.addSubview(self.tableView!)
    }
    
    func showNotFoundMessage() {
        let alertController = UIAlertController(title: "Error", message: "Picture not found", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showDetailPicture(detailModel: DetailModel) {
        self.title = detailModel.name
        
        self.detailModel = detailModel
        if self.detailModel?.name != nil {
            items.append(.DetailViewItemName)
        }
        if self.detailModel?.descriptionText?.characters.count > 0 {
            items.append(.DetailViewItemDescription)
        }
        if self.detailModel?.userName != nil {
            items.append(.DetailViewItemUser)
        }
        if self.detailModel?.camera != nil {
            items.append(.DetailViewItemCamera)
        }
        if self.detailModel?.latitude != nil && self.detailModel?.longitude != nil {
            items.append(.DetailViewItemMap)
        }
        self.tableView?.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let detailViewItem = self.items[indexPath.row]
        
        if detailViewItem == .DetailViewItemMap {
            let cellIdentifier = "LocationCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? DetailLocationCell
            cell?.setLocation((self.detailModel?.latitude)!, longitude: (self.detailModel?.longitude)!)
            return cell!
        }
        else if detailViewItem == .DetailViewItemUser {
            let cellIdentifier = "UserCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                cell?.textLabel?.font = UIFont.boldSystemFontOfSize(14)
                cell?.selectionStyle = .None
            }
            
            cell?.textLabel?.text = self.detailModel?.userName
            let placeholder = UIImage(named: "unknown_user")?.af_imageScaledToSize(CGSize(width: 60, height: 60)).af_imageRoundedIntoCircle()
            let composite = DynamicCompositeImageFilter([AspectScaledToFillSizeFilter(size: CGSize(width: 60, height: 60)), CircleFilter()])
            cell?.imageView?.af_setImageWithURL((self.detailModel?.userImage)!, placeholderImage: placeholder, filter: composite, imageTransition: .CrossDissolve(0.5))
            
            return cell!
        }
        else {
            let cellIdentifier = "SubtitleCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
                cell?.textLabel?.font = UIFont.boldSystemFontOfSize(14)
                cell?.detailTextLabel?.numberOfLines = 3
                cell?.selectionStyle = .None
            }
            
            switch detailViewItem {
            case .DetailViewItemName:
                cell?.detailTextLabel?.text = self.detailModel?.name
            case .DetailViewItemDescription:
                cell?.detailTextLabel?.text = self.detailModel?.descriptionText!.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            case .DetailViewItemCamera:
                cell?.detailTextLabel?.text = self.detailModel?.camera
            default:
                cell?.detailTextLabel?.text = nil
            }
            
            cell?.textLabel?.text = detailViewItem.titleForItem()
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let detailViewItem = self.items[indexPath.row]
        
        if detailViewItem == .DetailViewItemDescription {
            return 84.0
        }
        if detailViewItem == .DetailViewItemUser {
            return 72.0
        }
        else if detailViewItem == .DetailViewItemMap {
            return 340.0
        }
        
        return 54.0
    }
    
    
}
