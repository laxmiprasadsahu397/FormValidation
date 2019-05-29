//
//  FormListCell.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 29/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class FormListCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_Dob: UILabel!
    @IBOutlet weak var lbl_nation: UILabel!
    @IBOutlet weak var lbl_occupation: UILabel!
    @IBOutlet weak var lbl_age: UILabel!
    @IBOutlet weak var lbl_height: UILabel!
    @IBOutlet weak var lbl_drivSkill: UILabel!
    @IBOutlet weak var switchs: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(formObject: FormInput) {
        if let name = formObject.name {
           lbl_name.text = name
        }
        if let dob = formObject.birthDate {
            lbl_Dob.text = dob
        }
        if let nation = formObject.nationality {
            lbl_nation.text = nation
        }
        if let occupation = formObject.occupation {
            lbl_occupation.text = occupation
        }
        lbl_age.text = "\(formObject.age)"
        lbl_height.text = "\(formObject.height)"
        lbl_drivSkill.text = "DrivingSkill: \(formObject.drivingSkill)"
        self.switchs.isOn = formObject.vegetarian
    }

}
