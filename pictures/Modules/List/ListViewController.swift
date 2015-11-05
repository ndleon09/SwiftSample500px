//
//  ListViewController.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

let PhotoCellIdentifier : String = "PhotoCell"

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ListViewInterface {

    var listPresenter : ListPresenter?
    var mostPopularPhotos : [ListModel]?
    var tableView : UITableView?
    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Most Popular Photos"
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "loadData", forControlEvents: .ValueChanged)
        
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.backgroundColor = UIColor.whiteColor()
        self.tableView?.addSubview(self.refreshControl!)
        self.tableView?.registerClass(ListTableViewCell.self, forCellReuseIdentifier: PhotoCellIdentifier)
        self.view.addSubview(self.tableView!)
        
        self.loadData()
    }
    
    func loadData() {
        listPresenter?.updateView()
    }
    
    func showLoadingIndicator() {
        self.refreshControl?.beginRefreshing()
    }
    
    func hideLoadingIndicator() {
        self.refreshControl?.endRefreshing()
    }
    
    func showNoContentMessage() {
        let alertViewController = UIAlertController(title: "Alert", message: "No photos found", preferredStyle: .Alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    func showMostPopularPhotos(photos: [ListModel]?) {
        mostPopularPhotos = photos
        reloadPhotos()
    }
    
    func reloadPhotos() {
        tableView?.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSection = 1;
        if mostPopularPhotos?.count == nil {
            numberOfSection = 0;
        }
        return numberOfSection
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = mostPopularPhotos?.count
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(PhotoCellIdentifier) as! ListTableViewCell
        cell.configureCellFromListModel(self.mostPopularPhotos![indexPath.row])
        return cell
    }
}
