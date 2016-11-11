//
//  ListViewController.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import TableViewKit
import AlamofireImage

class ListViewController: UIViewController, ListViewInterfaceProtocol {

    var listPresenter : ListPresenterProtocol?
    
    var tableView : UITableView!
    var tableViewManager: TableViewManager!
    var refreshControl : UIRefreshControl!
    
    // MARK: Life view cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "500px"
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.addSubview(refreshControl!)
        view.addSubview(self.tableView!)
        
        tableViewManager = TableViewManager(tableView: tableView)
        tableViewManager.animation = .none
        
        loadData()
    }
    
    func loadData() {
        listPresenter?.updateView()
    }
    
    // MARK: Implement ListViewInterface protocol
    
    func showLoadingIndicator() {
        refreshControl.beginRefreshing()
    }
    
    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }
    
    func showNoContentMessage() {
        let alertViewController = UIAlertController(title: "Alert", message: "No photos found", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    func showMostPopularPhotos(photos: [ListModel]) {
        let section = ListSection(models: photos, presenter: listPresenter)
        tableViewManager.sections.replace(with: [section])
    }
}

/*
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mostPopularPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let photo = mostPopularPhotos[indexPath.row]
        let item = ListItem(model: photo)
        
        let cell = item.drawer.cell(forTableView: tableView, atIndexPath: indexPath)
        item.drawer.draw(cell: cell, withItem: item)
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = mostPopularPhotos[indexPath.row].id else { return }
        listPresenter?.showPhotoDetail(identifier: id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320.0
    }
}
 */

