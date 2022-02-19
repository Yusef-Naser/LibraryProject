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
        mainView.buttonChange.addTarget(self , action: #selector(actionChangePassword ), for: .touchUpInside)
    }
    
    @objc private func actionChangePassword () {
        presenter?.changePassword(password: mainView.textfieldPassword.text ?? "" , repeatedPassword: mainView.textfieldRePassword.text ?? "" , oldPassword: mainView.textfieldOldPassword.text ?? "")
    }
    
    
}

extension ChangePasswordVC : ProChangePasswordView , NavigationBarDelegate {
    func responseData() {
        self.navigationController?.popViewController(animated: true )
    }
    func navigationDismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    
}
