//
//  ChangePasswordPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProChangePasswordView : StatusApi {
    
}

protocol ProChangePasswordPresetner {

    
}


class ChangePasswordPresenter : ProChangePasswordPresetner {
    
    weak var view : ProChangePasswordView?
    private let interactor = ChangePasswordInteractor()
    
    init(view : ProChangePasswordView ) {
        self.view = view
    }
    
}
