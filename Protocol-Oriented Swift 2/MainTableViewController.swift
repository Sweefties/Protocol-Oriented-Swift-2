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
        case personType
        // other settings here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let person = Person(rawValue: (indexPath as NSIndexPath).row) {
            switch person {
            case .personType:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchInTextTableViewCell", for: indexPath) as! SwitchInTextTableViewCell
                
                // this is where the magic happens!
                let viewModel = PersonViewModel()
                cell.configure(withDataSource: viewModel, delegate: viewModel)
                return cell
            }
            
        }
        
        return tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
    }

}

extension MainTableViewController {
    // set UI style
    func setUI() {
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1.0)
    }
}
