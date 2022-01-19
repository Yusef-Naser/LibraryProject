//
//  MainTabBarVC.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//

import UIKit

class MainTabBarVC : BaseVC<MainTabBarView> {
    
    private var presenter : ProMainTabBarPresetner?
    
    private let home = HomeVC()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = MainTabBarPresenter(view : self )
        
        add(asChildViewController: home)
    }
    
    
    func add(asChildViewController viewController: UIViewController) {
        
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        mainView.containerView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = mainView.containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    
    func removeAllSubviews(){
        for subview in mainView.containerView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    
    
}

extension MainTabBarVC : ProMainTabBarView {
    
}
