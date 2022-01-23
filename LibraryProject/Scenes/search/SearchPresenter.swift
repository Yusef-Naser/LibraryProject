//
//  SearchPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC


protocol ProSearchView : StatusApi {
    func fetchData ()
}

protocol ProSearchPresetner {

    func getSearch (text : String)
    func getDataCount () -> Int
    func getItem (index : Int) -> String?
    
}


class SearchPresenter : ProSearchPresetner {
    
    weak var view : ProSearchView?
    private let interactor = SearchInteractor()
    private var dataArray : [String] = []
    
    
    init(view : ProSearchView ) {
        self.view = view
    }
    
    func getSearch(text: String) {
        interactor.getSearch(text: text) { data , error , statusCode in
            guard let data = data else {
                return
            }
            let array = data.getTitleArray()
            self.dataArray = array
            print(array)
            self.view?.fetchData()
        }
    }
    
    func getDataCount() -> Int {
        dataArray.count
    }
    
    func getItem(index: Int) -> String? {
        guard getDataCount() > index else {
            return nil
        }
        return dataArray[index]
    }
    
}
