//
//  OnBoarding.swift
//  LibraryProject
//
//  Created by yusef naser on 27/11/2025.
//

import Foundation
import UIKit

class OnBoardingVC : BaseVC<OnBoardingView> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.buttonLogin.addTarget(self , action: #selector(actionLogin), for: .touchUpInside)
    }
    
    @objc private func actionLogin () {
        
        if mainView.viewPage.currentPage() < 2 {
            let currentPage = mainView.viewPage.currentPage()
            var xOffset = mainView.bounds.width * CGFloat(currentPage + 1)

            mainView.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
           
            mainView.viewPage.setPage(page: currentPage + 1)
            
            if currentPage + 1 == 2 {
                mainView.buttonLogin.setTitle(SString.finish , for: .normal)
            }else {
                mainView.buttonLogin.setTitle(SString.next , for: .normal)
            }
        }else {
            parentNavigationController = UINavigationController()
            parentNavigationController?.navigationBar.isHidden = true
            parentNavigationController?.navigationBar.barTintColor = UIColor.orange
            parentNavigationController?.navigationBar.tintColor = UIColor.white
            parentNavigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
            parentNavigationController?.viewControllers = [MainLayoutTapsRouter.createModule()]
            
            UIApplication.shared.windows.first?.rootViewController = parentNavigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            SharedData.instance.setFirstTimeOnBoarding()
        }

        
        

    }
}
