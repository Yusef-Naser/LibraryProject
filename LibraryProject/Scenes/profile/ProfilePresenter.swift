//
//  ProfilePresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProProfileView : StatusApi {
    func fetchData ()
    func fetchLibraries ()
    func fetchCategories ()
}

protocol ProProfilePresetner {

    func updateProfile (name : String , city : String , address : String, categoryID : String ,   libraryID : String)
    func getUserObject () -> ModelProfile?
    
    func getLibraries ()
    func getLibrariesCount () -> Int
    func getLibrary (index : Int) -> ModelLibrary?
    
    func getCategoreis ()
    func getCategoreisCount () -> Int
    func getCategory (index : Int) -> [String:String]?
    func getCategoryString (index : Int) -> String
    
    func getUserData ()
    
}


class ProfilePresenter : ProProfilePresetner {
    
    weak var view : ProProfileView?
    private let interactor = ProfileInteractor()
    private var userObject : ModelProfile? = nil
    
    private var listLibraries = ModelLibraries()
    private var listCategories = [String:String]()
    
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
            self.view?.showMessage("success update")
        }
    }
    
    func getUserData() {
        self.view?.showLoading()
        interactor.getProfile { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.userObject = data
            self.view?.fetchData()
        }
    }
    
    func getUserObject() -> ModelProfile? {
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
    
    func getCategoreis () {
        self.listCategories = SharedData.instance.getCategories() ?? [:]
        self.view?.fetchCategories()
    }
    func getCategoreisCount () -> Int {
        self.listCategories.count
    }
    func getCategory (index : Int) -> [String:String]? {
        guard getCategoreisCount() > index else {
            return nil
        }
        let key = "\(Array(listCategories.keys)[index])"
        let value = listCategories[key] ?? ""
        return [key : value ]
    }
    
    func getCategoryString(index: Int) -> String {
        guard getCategoreisCount() > index else {
            return ""
        }
        let key = "\(Array(listCategories.keys)[index])"
        let value = listCategories[key] ?? ""
        return "\(value)(\(key)"
    }
}
