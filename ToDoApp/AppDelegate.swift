//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/15/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainNavController = ViewRepo.getMainNavigationController()
        mainNavController.viewControllers = [ViewRepo.getTasksVC()]
        window?.rootViewController = mainNavController
        return true
    }

}

