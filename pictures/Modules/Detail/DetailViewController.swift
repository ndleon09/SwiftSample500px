//
//  DetailViewController.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {

    var detailPresenter : DetailPresenter!
    var detailModel: DetailModel?
    var items: [ItemProtocol] = []
    var tableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "Detail"
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        view.addSubview(self.tableView)
    }
    
    func showNotFoundMessage() {
        
        let alertController = UIAlertController(title: "Error", message: "Picture not found", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showDetailPicture(detailModel: DetailModel) {
        
        self.detailModel = detailModel
        
        let userItem = DetailInfoItem(image: detailModel.userImage, title: detailModel.userName, subtitle: nil)
        userItem.height = 72.0
        items.append(userItem)
        
        let nameItem = DetailInfoItem(image: nil, title: "Title", subtitle: detailModel.name)
        items.append(nameItem)
        
        if let description = detailModel.descriptionText {
            let descriptionItem = DetailInfoItem(image: nil, title: "Description", subtitle: description)
            descriptionItem.height = 80
            items.append(descriptionItem)
        }
        
        if let camera = detailModel.camera {
            let cameraItem = DetailInfoItem(image: nil, title: "Camera", subtitle: camera)
            items.append(cameraItem)
        }
        
        if let latitude = detailModel.latitude, let longitude = detailModel.longitude {
            let locationItem = DetailLocationItem(latitude: latitude, longitude: longitude)
            items.append(locationItem)
        }
        
        title = detailModel.name
        tableView.reloadData()
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailItem = items[indexPath.row]
        
        let cell = detailItem.drawer.cell(forTableView: tableView, atIndexPath: indexPath)
        detailItem.drawer.draw(cell: cell, withItem: detailItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let detailItem = items[indexPath.row]
        return CGFloat(detailItem.height)
    }
}

extension DetailViewController: UITableViewDelegate {
    
}
