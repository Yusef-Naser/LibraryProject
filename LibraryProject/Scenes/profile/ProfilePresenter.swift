//
//  ProfilePresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProProfileView : StatusApi {
    func fetchData ()
}

protocol ProProfilePresetner {

    func updateProfile (name : String , city : String , address : String, categoryID : String ,   libraryID : String)
    func getUserData () -> ModelUser?
}


class ProfilePresenter : ProProfilePresetner {
    
    weak var view : ProProfileView?
    private let interactor = ProfileInteractor()
    private var userObject : ModelUser? = nil
    
    init(view : ProProfileView ) {
        self.view = view
    }
    
    func updateProfile (name : String , city : String , address : String, categoryID : String , libraryID : String) {
        interactor.updateProfile(name: name , city: city , address: address , categoryID: categoryID, libraryID: libraryID) { data , error, statusCode in
            guard let data = data else {
                return
            }
            self.userObject = data
            self.view?.fetchData()
        }
    }
    
    func getUserData() -> ModelUser? {
        return userObject
    }
}
