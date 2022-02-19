//
//  LoginPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


protocol ProLoginView : StatusApi {
    func loginSuccess ()
    func loginFailed ()
}

protocol ProLoginPresetner {

    func login (userName : String , password : String)
    
}


class LoginPresenter : ProLoginPresetner {
    
    weak var view : ProLoginView?
    private let interactor = LoginInteractor()
    
    init(view : ProLoginView ) {
        self.view = view
    }
    
    func login(userName: String, password: String) {
        self.view?.showLoading()
        interactor.login(userName: userName , password: password) { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            if data.borrowerid != nil {
                self.view?.loginSuccess()
            }else {
                self.view?.loginFailed()
            }
        }
    }
    
}
