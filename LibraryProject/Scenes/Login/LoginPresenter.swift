//
//  LoginPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


protocol ProLoginView : StatusApi {
    
}

protocol ProLoginPresetner {

    
}


class LoginPresenter : ProLoginPresetner {
    
    weak var view : ProLoginView?
    private let interactor = LoginInteractor()
    
    init(view : ProLoginView ) {
        self.view = view
    }
    
}
