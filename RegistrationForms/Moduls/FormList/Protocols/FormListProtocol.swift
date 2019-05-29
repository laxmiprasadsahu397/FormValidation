//
//  FormListProtocol.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import UIKit

protocol FormListViewProtocol: class {
    var presenter: FormListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    
    func showData(formInputList: [FormInput])
    func showError()
}

protocol FormListWireFrameProtocol: class {
    
    // PRESENTER -> WIREFRAME
    static func createFormListModule() -> UIViewController
}

protocol FormListPresenterProtocol: class {
    var view: FormListViewProtocol? { get set }
    var interactor: FormListInteractorInputProtocol? { get set }
    var wireFrame: FormListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func retrieveFormList()
}

protocol FormListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
        func didRetrieveFormList(_ formListResponseModel: [FormInput])
        func onError()
}

protocol FormListInteractorInputProtocol: class {
    var presenter: FormListInteractorOutputProtocol? { get set }
    var localDatamanager: FormListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FormListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveFormList()
}

protocol FormListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol FormListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: FormListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveFormList()
}

protocol FormListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func didRetrieveFormList(_ formListResponseModel: [FormInput])
    func onError()
}

protocol FormListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveFormList()
    var localRequestHandler: FormListLocalDataManagerOutputProtocol? { get set }
}
protocol FormListLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
    func didRetrieveFormList(_ formListResponseModel: [FormInput])
    func onError()
}
