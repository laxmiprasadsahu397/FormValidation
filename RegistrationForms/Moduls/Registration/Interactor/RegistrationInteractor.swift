//
//  RegistrationInteractor.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class RegistrationInteractor: RegistrationInteractorInputProtocol {
    
    weak var presenter: RegistrationInteractorOutputProtocol?
    var localDatamanager: RegistrationLocalDataManagerInputProtocol?
    var remoteDatamanager: RegistrationRemoteDataManagerInputProtocol?
    
   func saveFormDetails(formInputModel: FormInputModel) {
        self.localDatamanager?.saveFormDetails(formInputModel: formInputModel)
    }
}
extension RegistrationInteractor: RegistrationRemoteDataManagerOutputProtocol {
//    func didRetrieveData(_ formResponseModel: FormResponseModel) {
//        self.presenter?.didRetrieveData(formResponseModel)
//    }
    
    func onError() {
      self.presenter?.onError()
    }
    
    
}
