//
//  RegistrationProtocol.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import UIKit

protocol RegistrationViewProtocol: class {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    
//    func showData(_ formResponseModel: FormResponseModel)
    func showError()
}

protocol RegistrationWireFrameProtocol: class {
    
    // PRESENTER -> WIREFRAME
    static func createRegistrationModule(window: UIWindow)
}

protocol RegistrationPresenterProtocol: class {
    var view: RegistrationViewProtocol? { get set }
    var interactor: RegistrationInteractorInputProtocol? { get set }
    var wireFrame: RegistrationWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func saveFormDetails(formInputModel: FormInputModel)
}

protocol RegistrationInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
//        func didRetrieveData(_ formResponseModel: FormResponseModel)
        func onError()
}

protocol RegistrationInteractorInputProtocol: class {
    var presenter: RegistrationInteractorOutputProtocol? { get set }
    var localDatamanager: RegistrationLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: RegistrationRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func saveFormDetails(formInputModel: FormInputModel)
}

protocol RegistrationDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol RegistrationRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: RegistrationRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func saveFormDetails(formInputModel: FormInputModel)
}

protocol RegistrationRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
//    func didRetrieveData(_ formResponseModel: FormResponseModel)
    func onError()
}

protocol RegistrationLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    
    var localRequestHandler: RegistrationLocalDataManagerOutputProtocol? { get set }
    func saveFormDetails(formInputModel: FormInputModel)
}
protocol RegistrationLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
    //    func didRetrieveData(_ formResponseModel: FormResponseModel)
    func onError()
}
