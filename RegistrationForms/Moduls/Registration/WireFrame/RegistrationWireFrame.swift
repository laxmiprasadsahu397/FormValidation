//
//  RegistrationWireFrame.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import UIKit

class RegistrationWireFrame: RegistrationWireFrameProtocol {
    
    var rootWireframe: RootWireframe?
    
    static func createRegistrationModule(window: UIWindow) {
        let navController = registrationStoryboard.instantiateViewController(withIdentifier: "RegistrationID")
        if let view = navController as? RegistrationView {
            let rootWireframe = RootWireframe()
            let presenter: RegistrationPresenterProtocol & RegistrationInteractorOutputProtocol = RegistrationPresenter()
            let interactor: RegistrationInteractorInputProtocol & RegistrationRemoteDataManagerOutputProtocol = RegistrationInteractor()
            let localDataManager: RegistrationLocalDataManagerInputProtocol = RegistrationLocalDataManager()
            let remoteDataManager: RegistrationRemoteDataManagerInputProtocol = RegistrationRemoteDataManager()
            let wireFrame: RegistrationWireFrameProtocol = RegistrationWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            let navigation = rootWireframe.navigationControllerFromWindow(window: window)
            navigation.setViewControllers([view], animated: true)
            window.rootViewController = navigation
        }
        
    }
    
    static var registrationStoryboard: UIStoryboard {
        return UIStoryboard(name: "Registration", bundle: Bundle.main)
    }
}
