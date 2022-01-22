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
        
        parentNavigationController = UINavigationController(rootViewController: MainTabBarVC())
        
        window?.rootViewController = parentNavigationController
        
        return true
    }

  


}

