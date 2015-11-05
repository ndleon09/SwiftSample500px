//
//  DetailViewController.swift
//  pictures
//
//  Created by Nelson on 05/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewInterface {

    var detailPresenter : DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func showLoadingIndicator() {
        
    }
}
