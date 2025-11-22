//
//  MainViewController.swift
//  LibraryProject
//
//  Created by yusef naser on 08/11/2025.
//

import UIKit

class MainViewController : BaseVC<MainView> {
    
    private let home = HomeVC()
    private let favorite = FavoritesVC()
    private let settings = MenuVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.setDelegate(deledate: self)
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

extension MainViewController : TabBarDelegate {
    func tabBar(_ tabBar: TabBar, didSelectTabAt index: Int) {
        removeAllSubviews()
        if index == 0 {
            add(asChildViewController: home)
        }else if index == 1 {
            add(asChildViewController: favorite)
        }else if index == 2 {
            add(asChildViewController: settings)
        }
    }
    
}
