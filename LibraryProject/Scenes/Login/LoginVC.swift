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
        mainView.navigation.delegateNavigation = self
        mainView.buttonLogin.addTarget(self , action: #selector(actionLogin), for: .touchUpInside)
        
    }
    
    @objc private func actionLogin () {
        presenter?.login(userName: mainView.textFieldEmail.text ?? "" , password: mainView.textFieldPassword.text ?? "")
    }
    
    
}

extension LoginVC : ProLoginView , NavigationBarDelegate {
    func navigationDismissView() {
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
