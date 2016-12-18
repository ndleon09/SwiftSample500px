//
//  DetailViewController.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit
import TableViewKit

class DetailViewController: UIViewController, DetailViewProtocol {

    var detailPresenter : DetailPresenterProtocol?
    var photo: Double?
    var tableViewManager: TableViewManager?

    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "Detail"
        
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableViewManager = TableViewManager(tableView: tableView)
        tableViewManager?.animation = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDetailPhoto()
    }
    
    private func loadDetailPhoto() {
        
        guard let photo = photo else { return }
        detailPresenter?.loadDetailFromIdentifier(identifier: photo)
    }
    
    func showNotFoundMessage() {
        
        let alertController = UIAlertController(title: "Error", message: "Picture not found", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showDetailPicture(detailModel: DetailModel) {
        
        let section = DetailViewSection(model: detailModel)
        tableViewManager?.sections.replace(with: [section])
    }
}
