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
    
    func showNotFoundMessage() {
        let alertController = UIAlertController(title: "Error", message: "Picture not found", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showDetailPicture(detailModel: DetailModel) {
        self.title = detailModel.name
    }
}
