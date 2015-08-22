//
//  MainTableViewController.swift
//  Protocol-Oriented Swift 2
//
//  Created by Wlad Dicario on 22/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    enum Person: Int {
        case PersonType
        // other settings here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let person = Person(rawValue: indexPath.row) {
            switch person {
            case .PersonType:
                let cell = tableView.dequeueReusableCellWithIdentifier("SwitchInTextTableViewCell", forIndexPath: indexPath) as! SwitchInTextTableViewCell
                
                // this is where the magic happens!!
                let viewModel = PersonViewModel()
                cell.configure(withDataSource: viewModel, delegate: viewModel)
                return cell
            }
            
        }
        
        return tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)
    }

}
