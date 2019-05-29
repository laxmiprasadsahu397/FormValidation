//
//  CustomCell.swift
//  CustomizedAlartView
//
//  Created by LaxmiPrasad Sahu on 15/04/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateData(nationalityName: String) {
        self.lbl_name.text = nationalityName
    }

}
