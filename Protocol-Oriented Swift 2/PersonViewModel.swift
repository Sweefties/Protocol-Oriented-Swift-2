//
//  PersonViewModel.swift
//  Protocol-Oriented Swift 2
//
//  Created by Wlad Dicario on 22/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

struct PersonViewModel: SwitchInTextCellDataSource {
    var title = "Person Index."
    var switchOn = true
}

extension PersonViewModel: SwitchInTextCellDelegate {
    
    func onSwitchTogleOn(on: Bool) {
        if on {
            print("The Person switch On!")
        } else {
            print("The Person switch Off!")
        }
    }
    
    var switchColor: UIColor {
        return .lightGrayColor()
    }
}