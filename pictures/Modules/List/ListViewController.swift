//
//  ListViewController.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import AlamofireImage

let PhotoCellIdentifier : String = "PhotoCell"

class ListViewController: UIViewController, ListViewInterfaceProtocol {

    var listPresenter : ListPresenter!
    var mostPopularPhotos : [ListModel] = []
    
    var tableView : UITableView!
    var refreshControl : UIRefreshControl!
    
    // MARK: Life view cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "500px"
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), forControlEvents: .ValueChanged)
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.addSubview(self.refreshControl!)
        tableView.registerClass(ListTableViewCell.self, forCellReuseIdentifier: PhotoCellIdentifier)
        view.addSubview(self.tableView!)
        
        loadData()
    }
    
    func loadData() {
        listPresenter.updateView()
    }
    
    // MARK: Implement ListViewInterface protocol
    
    func showLoadingIndicator() {
        refreshControl.beginRefreshing()
    }
    
    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }
    
    func showNoContentMessage() {
        let alertViewController = UIAlertController(title: "Alert", message: "No photos found", preferredStyle: .Alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    func showMostPopularPhotos(photos: [ListModel]) {
        
        mostPopularPhotos = photos
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mostPopularPhotos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let photo = mostPopularPhotos[indexPath.row]
        let item = ListItem(model: photo)
        
        let cell = item.drawer.cell(forTableView: tableView, atIndexPath: indexPath)
        item.drawer.draw(cell: cell, withItem: item)
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let listModel = mostPopularPhotos[indexPath.row]
        listPresenter.showPhotoDetailFromIdentifier(listModel.id!)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 320.0
    }
}

