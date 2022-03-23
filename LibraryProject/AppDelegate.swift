//
//  AppDelegate.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/01/2022.
//

import UIKit
import IQKeyboardManagerSwift

var parentNavigationController : UINavigationController?

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        if SharedData.instance.getLangauge().contains( LanguageEnum.en.rawValue) {
            SharedData.instance.setLangauge(lang: .en)
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else {
            SharedData.instance.setLangauge(lang: .ar)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
       // if SharedData.instance.getUserID() != 0 {
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
//        }else {
//            parentNavigationController = UINavigationController(rootViewController: LoginVC())
//
//            window?.rootViewController = parentNavigationController
//        }
        


 
        return true
    }

}

