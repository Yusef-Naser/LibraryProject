//
//  ChangePasswordVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class ChangePasswordVC : BaseVC<ChangePasswordView> {
    
    private var presenter : ProChangePasswordPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = ChangePasswordPresenter(view : self )
        mainView.navigation.delegateNavigation = self
        
    }
    
    
}

extension ChangePasswordVC : ProChangePasswordView , NavigationBarDelegate {
    
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
}
