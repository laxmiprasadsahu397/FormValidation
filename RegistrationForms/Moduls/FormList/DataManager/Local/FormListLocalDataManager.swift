//
//  FormListLocalDataManager.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class FormListLocalDataManager: FormListLocalDataManagerInputProtocol {
    
    var localRequestHandler: FormListLocalDataManagerOutputProtocol?
    
    func retrieveFormList() {
        guard let inputformList = RegistrationDataHandler.fetchFormList()  else {
        localRequestHandler?.onError()
            return
        }
        localRequestHandler?.didRetrieveFormList(inputformList)
    }
}
