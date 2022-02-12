//
//  ProfileVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//

import UIKit

class ProfileVC : BaseVC<ProfileView> {
    
    private var presenter : ProProfilePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = ProfilePresenter(view : self )
        mainView.navigation.delegateNavigation = self
        mainView.buttonUpdate.addTarget(self , action: #selector(actionUpdate ), for: .touchUpInside)
    }
    
    @objc private func actionUpdate () {
        presenter?.updateProfile()
    }
    
    
}

extension ProfileVC : ProProfileView , NavigationBarDelegate {
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
}
