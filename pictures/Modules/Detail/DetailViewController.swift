//
//  DetailViewController.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

enum DetailViewItems {
    case DetailViewItemName, DetailViewItemDescription, DetailViewItemCamera, DetailViewItemUser, DetailViewItemMap
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailViewInterface {

    var detailPresenter : DetailPresenter?
    var detailModel: DetailModel?
    var items: [DetailViewItems] = []
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.backgroundColor = UIColor.whiteColor()
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
        if self.detailModel?.descriptionText != nil {
            items.append(.DetailViewItemDescription)
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
            return UITableViewCell()
        }
        else {
            let cellIdentifier = "SubtitleCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            if cell == nil {
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
                
            }
            return cell!
        }
    }
}
