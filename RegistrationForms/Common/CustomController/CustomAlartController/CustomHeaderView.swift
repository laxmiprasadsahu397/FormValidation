//
//  CustomHeaderView.swift
//  CustomizedAlartView
//
//  Created by LaxmiPrasad Sahu on 15/04/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

protocol CustomHeaderViewDelegate {
    func btn_closeAction(_ sender: UIButton)
}

class CustomHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var btn_close: UIButton!
    
    var delegate: CustomHeaderViewDelegate?

    @IBAction func btn_closeAction(_ sender: UIButton) {
        self.delegate?.btn_closeAction(sender)
    }
    
}
