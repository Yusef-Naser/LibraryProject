//
//  AppDelegate.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navController = UINavigationController()
        navController.navigationBar.isHidden = true
        navController.navigationBar.barTintColor = UIColor.orange
        navController.navigationBar.tintColor = UIColor.white
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let vc = MainLayoutTapsRouter.createModule()
        navController.viewControllers = [vc]
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

  


}

