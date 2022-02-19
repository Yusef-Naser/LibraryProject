//
//  ChangePasswordPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProChangePasswordView : StatusApi {
    func responseData ()
}

protocol ProChangePasswordPresetner {

    func changePassword (password : String , repeatedPassword : String, oldPassword : String)
    
}


class ChangePasswordPresenter : ProChangePasswordPresetner {
    
    weak var view : ProChangePasswordView?
    private let interactor = ChangePasswordInteractor()
    
    init(view : ProChangePasswordView ) {
        self.view = view
    }
    
    func changePassword(password: String, repeatedPassword: String, oldPassword: String) {
        self.view?.showLoading()
        interactor.changePassword(oldPassword: oldPassword, password: password , repeatedPassword: repeatedPassword) { data , error, statusCode in
            self.view?.hideLoading()
            if data?.getValue() == "" {
                self.view?.responseData()
            }
        }
    }
}
