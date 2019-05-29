//
//  RegistrationLocalDataManager.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class RegistrationLocalDataManager: RegistrationLocalDataManagerInputProtocol {
    var localRequestHandler: RegistrationLocalDataManagerOutputProtocol?
    
    func saveFormDetails(formInputModel: FormInputModel) {
        RegistrationDataHandler.addOrUpdateSigninResponseEntity(inputFormModel: formInputModel)
    }
    
}
