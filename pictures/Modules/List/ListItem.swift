//
//  ListItem.swift
//  pictures
//
//  Created by Nelson Dominguez on 25/06/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import TableViewKit

typealias OnSelectionCallBack = (Selectable) -> Void

class ListSection: Section {
    
    var items: ObservableArray<Item> = []
    
    init(models: [ListModel], presenter: ListPresenterProtocol?) {
        
        let items = models.map { model -> ListItem in
            let onSelection: OnSelectionCallBack = { item in
                guard let id = model.id else { return }
                presenter?.showPhotoDetail(identifier: id)
            }
            let item = ListItem(model: model, onSelection: onSelection)
            return item
        }
        
        self.items.replace(with: items)
    }
}

class ListItem: Item, Selectable {
    
    var drawer: CellDrawer.Type = ListDrawer.self
    var height: Height? = Height.dynamic(375.0)
    var onSelection: OnSelectionCallBack
    
    var model: ListModel
    
    init(model: ListModel, onSelection: @escaping OnSelectionCallBack) {
        self.model = model
        self.onSelection = onSelection
    }
}
