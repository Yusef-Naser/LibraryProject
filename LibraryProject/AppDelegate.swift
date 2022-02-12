//
//  AppDelegate.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/01/2022.
//

import UIKit

var parentNavigationController : UINavigationController?

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

//        parentNavigationController = UINavigationController(rootViewController: LoginVC())
//
//        window?.rootViewController = parentNavigationController

        window = UIWindow(frame: UIScreen.main.bounds)

        parentNavigationController = UINavigationController()
        parentNavigationController?.navigationBar.isHidden = true
        parentNavigationController?.navigationBar.barTintColor = UIColor.orange
        parentNavigationController?.navigationBar.tintColor = UIColor.white
        parentNavigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let vc = MainLayoutTapsRouter.createModule()
        parentNavigationController?.viewControllers = [vc]
        window?.rootViewController = parentNavigationController
        window?.makeKeyAndVisible()
 
        return true
    }

}

