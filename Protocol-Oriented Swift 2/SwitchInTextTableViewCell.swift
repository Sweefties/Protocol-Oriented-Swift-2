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
    func onSwitchTogleOn(on: Bool)
    
    var switchColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension SwitchInTextCellDelegate {
    
    var switchColor: UIColor {
        return .purpleColor()
    }
    
    var textColor: UIColor {
        return .blackColor()
    }
    
    var font: UIFont {
        return .systemFontOfSize(16)
    }
}

class SwitchInTextTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var switchToggle: UISwitch!
    
    private var dataSource: SwitchInTextCellDataSource?
    private var delegate: SwitchInTextCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDataSource dataSource: SwitchInTextCellDataSource, delegate: SwitchInTextCellDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        label.text = dataSource.title
        switchToggle.on = dataSource.switchOn
        // color option added!
        switchToggle.onTintColor = delegate?.switchColor
    }
    
    @IBAction func onSwitchToggle(sender: UISwitch) {
        delegate?.onSwitchTogleOn(sender.on)
    }

}
