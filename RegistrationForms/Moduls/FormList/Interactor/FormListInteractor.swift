//
//  FormListInteractor.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class FormListInteractor: FormListInteractorInputProtocol {
    
    weak var presenter: FormListInteractorOutputProtocol?
    var localDatamanager: FormListLocalDataManagerInputProtocol?
    var remoteDatamanager: FormListRemoteDataManagerInputProtocol?
    
    func retrieveFormList() {
        self.localDatamanager?.retrieveFormList()
    }
}

extension FormListInteractor: FormListRemoteDataManagerOutputProtocol, FormListLocalDataManagerOutputProtocol {
    func didRetrieveFormList(_ formListResponseModel: [FormInput]) {
       self.presenter?.didRetrieveFormList(formListResponseModel)
    }
    
    func onError() {
      self.presenter?.onError()
    }
    
    
}
