//
//  AppDelegate.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 15/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit
import Resolver

class AppController: NSObject {
    
    @Injected private var userRepository: UserRepository
    
    let mainWindow: UIWindow
    
    override init() {
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        super.init()
    }
    
    func setupNavController(_ root: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: root)
        return navigationController
    }
    
    func setupInitialViewController() -> UIViewController {
        let hasUserLogged = userRepository.getAccessToken() != nil
        
        let authViewController = AuthenticationViewController()
        let homeViewController = HomeViewController()
        
        return hasUserLogged ? homeViewController : authViewController
    }
    
}
