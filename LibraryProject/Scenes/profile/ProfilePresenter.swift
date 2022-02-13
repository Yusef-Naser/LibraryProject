//
//  ProfilePresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProProfileView : StatusApi {
    
}

protocol ProProfilePresetner {

    func updateProfile ()
}


class ProfilePresenter : ProProfilePresetner {
    
    weak var view : ProProfileView?
    private let interactor = ProfileInteractor()
    
    init(view : ProProfileView ) {
        self.view = view
    }
    
    func updateProfile() {
        interactor.updateProfile { data , error, statusCode in
            
        }
    }
    
}
