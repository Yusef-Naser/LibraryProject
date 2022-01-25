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
        interactor.login(userName: userName , password: password) { data , error , statusCode in
            guard let data = data else {
                return
            }
            if data.response?.status?.t == "ok" {
                self.view?.loginSuccess()
            }else if data.response?.status?.t == "failed"{
                self.view?.loginFailed()
            }else {
                self.view?.loginFailed()
            }
        }
    }
    
}
