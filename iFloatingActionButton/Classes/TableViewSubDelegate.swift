//
//  TableViewSubDelegate.swift
//  iFloatingActionButton
//
//  Created by Akshay Agrawal on 29/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import UIKit

class TableViewSubDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

    var floatingItemsArray:[FloatingItem] = []
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.floatingItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let floatingItemCell = tableView.dequeueReusableCell(withIdentifier: "FloatingItemCell", for: indexPath) as! FloatingItemCell
        let floatingItemModel:FloatingItem = self.floatingItemsArray[indexPath.row]
        floatingItemCell.initCell(floatingItemModel)
        return floatingItemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let floatingItem:FloatingItem = self.floatingItemsArray[indexPath.row]
        floatingItem.itemClickHandler!()
    }

}
