//
//  RootWireframe.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {

    override init() {
        super.init()
    }
    
    func showRootViewController(viewController: UIViewController,  inWindow window: UIWindow) {
        let navigationController = self.navigationControllerFromWindow(window: window)
        navigationController.viewControllers = [viewController]
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.navigationBar.barTintColor = UIColor.init(red: 51/255, green: 50/255, blue: 47/255, alpha: 1)
        navigationController.navigationBar.tintColor = UIColor.white
        return navigationController
    }
}
