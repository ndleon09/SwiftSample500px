//
//  TableViewProtocols.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit

protocol ItemProtocol {
    
    var drawer: DrawerProtocol { get set }
    var height: Float { get set }
}

protocol DrawerProtocol {
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: NSIndexPath) -> UITableViewCell
    func draw(cell cell: UITableViewCell, withItem: ItemProtocol)
}