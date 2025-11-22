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
        mainView.backButton.addTarget(self , action: #selector(dismissView), for: .touchUpInside)
        mainView.buttonLogin.addTarget(self , action: #selector(actionLogin), for: .touchUpInside)
        
    }
    
    @objc private func actionLogin () {
        presenter?.login(userName: mainView.textFieldEmail.textField.text ?? "" , password: mainView.textFieldPassword.textField.text ?? "")
    }
    
    
}

extension LoginVC : ProLoginView  {
    @objc func dismissView() {
        self.navigationController?.popViewController(animated: true )
    }
    func loginSuccess() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        parentNavigationController = UINavigationController()
        parentNavigationController?.navigationBar.isHidden = true
        parentNavigationController?.navigationBar.barTintColor = UIColor.orange
        parentNavigationController?.navigationBar.tintColor = UIColor.white
        parentNavigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let vc = MainLayoutTapsRouter.createModule()
        parentNavigationController?.viewControllers = [vc]
        appDelegate.window?.rootViewController = parentNavigationController
        appDelegate.window?.makeKeyAndVisible()
        
    }
    
    func loginFailed() {
        
    }
    
}
