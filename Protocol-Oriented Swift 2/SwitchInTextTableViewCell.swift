//
//  SwitchInTextTableViewCell.swift
//  Protocol-Oriented Swift 2
//
//  Created by Wlad Dicario on 22/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

protocol SwitchInTextCellDataSource {
    var title: String { get }
    var switchOn: Bool { get }
}

protocol SwitchInTextCellDelegate {
    func onSwitchTogleOn(_ on: Bool)
    
    var switchColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension SwitchInTextCellDelegate {
    
    var switchColor: UIColor {
        return UIColor.purple
    }
    
    var textColor: UIColor {
        return UIColor.black
    }
    
    var font: UIFont {
        return .systemFont(ofSize: 16)
    }
}

class SwitchInTextTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var switchToggle: UISwitch!
    
    fileprivate var dataSource: SwitchInTextCellDataSource?
    fileprivate var delegate: SwitchInTextCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDataSource dataSource: SwitchInTextCellDataSource, delegate: SwitchInTextCellDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        label.text = dataSource.title
        switchToggle.isOn = dataSource.switchOn
        // color option added!
        switchToggle.onTintColor = delegate?.switchColor
    }
    
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchTogleOn(sender.isOn)
    }

}
