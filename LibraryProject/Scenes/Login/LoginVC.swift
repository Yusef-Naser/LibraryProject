//
//  LoginVC.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

import UIKit

class LoginVC : BaseVC<LoginView> {
    
    private var presenter : ProLoginPresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = LoginPresenter(view : self )
        
        
    }
    
    
}

extension LoginVC : ProLoginView {
    
}
