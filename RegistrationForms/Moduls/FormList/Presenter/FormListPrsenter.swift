//
//  FormListPrsenter.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation

class FormListPresenter: FormListPresenterProtocol {
    
    weak var view: FormListViewProtocol?
    var interactor: FormListInteractorInputProtocol?
    var wireFrame: FormListWireFrameProtocol?
    
    func retrieveFormList() {
      self.interactor?.retrieveFormList()
    }
}
extension FormListPresenter: FormListInteractorOutputProtocol{
    func didRetrieveFormList(_ formListResponseModel: [FormInput]) {
        self.view?.showData(formInputList: formListResponseModel)
    }
    
    func onError() {
       self.view?.showError()
    }
    
}
