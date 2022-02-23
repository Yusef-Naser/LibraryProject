//
//  ProfilePresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProProfileView : StatusApi {
    func fetchData ()
    func fetchLibraries ()
}

protocol ProProfilePresetner {

    func updateProfile (name : String , city : String , address : String, categoryID : String ,   libraryID : String)
    func getUserData () -> ModelUser?
    
    func getLibraries ()
    func getLibrariesCount () -> Int
    func getLibrary (index : Int) -> ModelLibrary?
    
}


class ProfilePresenter : ProProfilePresetner {
    
    weak var view : ProProfileView?
    private let interactor = ProfileInteractor()
    private var userObject : ModelUser? = nil
    
    private var listLibraries = ModelLibraries()
    
    init(view : ProProfileView ) {
        self.view = view
    }
    
    func updateProfile (name : String , city : String , address : String, categoryID : String , libraryID : String) {
        self.view?.showLoading()
        interactor.updateProfile(name: name , city: city , address: address , categoryID: categoryID, libraryID: libraryID) { data , error, statusCode in
            self.view?.hideLoading()
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
    
    
    func getLibraries () {
        self.view?.showLoading()
        interactor.getLibraries { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.listLibraries = data
            self.view?.fetchLibraries()
        }
    }
    func getLibrariesCount () -> Int {
        listLibraries.count
    }
    func getLibrary (index : Int) -> ModelLibrary? {
        guard getLibrariesCount() > index else {
            return nil
        }
        return listLibraries[index]
    }
}
