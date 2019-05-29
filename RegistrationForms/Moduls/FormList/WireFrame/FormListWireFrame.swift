//
//  FormListWireFrame.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import UIKit

class FormListWireFrame: FormListWireFrameProtocol {
    
    var rootWireframe: RootWireframe?
    
    static func createFormListModule()  -> UIViewController {
        let navController = registrationStoryboard.instantiateViewController(withIdentifier: "FormListID")
        if let view = navController as? FormListView {
            let presenter: FormListPresenterProtocol & FormListInteractorOutputProtocol = FormListPresenter()
            let interactor: FormListInteractorInputProtocol & FormListRemoteDataManagerOutputProtocol & FormListLocalDataManagerOutputProtocol = FormListInteractor()
            let localDataManager: FormListLocalDataManagerInputProtocol = FormListLocalDataManager()
            let remoteDataManager: FormListRemoteDataManagerInputProtocol = FormListRemoteDataManager()
            let wireFrame: FormListWireFrameProtocol = FormListWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            localDataManager.localRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
        
    }
    
    static var registrationStoryboard: UIStoryboard {
        return UIStoryboard(name: "FormList", bundle: Bundle.main)
    }
}
