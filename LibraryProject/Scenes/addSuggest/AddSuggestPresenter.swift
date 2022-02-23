//
//  AddSuggestPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


protocol ProAddSuggestView : StatusApi {
    func fetchData ()
    func fetchLibraries ()
}

protocol ProAddSuggestPresetner {

    func addSuggest (title : String , author : String , copyRightDate : String ,
                     publisher : String , collectionTitle : String ,
                     publicationPlace : String , quantity : String , itemType : String ,
                     library : String , notes : String)
    func getLibraries ()
    func getLibrariesCount () -> Int
    func getLibrary (index : Int) -> ModelLibrary?
}


class AddSuggestPresenter : ProAddSuggestPresetner {
    
    weak var view : ProAddSuggestView?
    private let interactor = AddSuggestInteractor()
    private var listLibraries = ModelLibraries()
    init(view : ProAddSuggestView ) {
        self.view = view
    }
    
    func addSuggest(title : String , author : String , copyRightDate : String ,
                    publisher : String , collectionTitle : String ,
                    publicationPlace : String , quantity : String , itemType : String ,
                    library : String , notes : String) {
        self.view?.showLoading()
        interactor.addSuggest(title: title , author : author , copyRightDate: copyRightDate, publisher: publisher , collectionTitle: collectionTitle , publicationPlace: publicationPlace , quantity: quantity , itemType: itemType , library: library , notes: notes) { data , error, statusCode in
            
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.view?.fetchData()
        }
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
