//
//  RegistrationPrsenter.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view: RegistrationViewProtocol?
    var interactor: RegistrationInteractorInputProtocol?
    var wireFrame: RegistrationWireFrameProtocol?
    
    func saveFormDetails(formInputModel: FormInputModel) {
      self.interactor?.saveFormDetails(formInputModel: formInputModel)
    }
}
extension RegistrationPresenter: RegistrationInteractorOutputProtocol{
//    func didRetrieveData(_ formResponseModel: FormResponseModel) {
//        self.view?.showData(formResponseModel)
//    }
//
    func onError() {
       self.view?.showError()
    }
    
    
}
