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
    func getItem (index : Int) -> (String , String)?
    func callPagination (index : Int )
}


class SearchPresenter : ProSearchPresetner {
    
    weak var view : ProSearchView?
    private let interactor = SearchInteractor()
    private var dataArray : [(String , String)] = []
    
    private var textSearch = ""
    private var loadSearch = false
//    private var limitItems = false
    
    init(view : ProSearchView ) {
        self.view = view
    }
    
    func getSearch(text: String) {
        if text != textSearch {
            self.dataArray = []
            self.view?.fetchData()
        }
        textSearch = text
        self.view?.showLoading()
        self.loadSearch = true
        
//        if limitItems == true {
//            return
//        }
        
        interactor.getSearch(text: text , from: dataArray.count + 1 , to : dataArray.count + 10 ) { data , error , statusCode in
            self.view?.hideLoading()
            self.loadSearch = false
            
            guard let data = data else {
                return
            }
//            if data.getTitleArray().count == 0 && self.dataArray.count > 0 {
//                self.limitItems = true
//            }
            let array = data.getTitleArray()
            self.dataArray += array
            print(array)
            self.view?.fetchData()
        }
    }
    
    func getDataCount() -> Int {
        dataArray.count
    }
    
    func getItem(index: Int) -> (String , String)? {
        guard getDataCount() > index else {
            return nil
        }
        return dataArray[index]
    }
    
    func callPagination(index: Int) {
        if index == dataArray.count - 1 && loadSearch == false  {
            getSearch(text: textSearch)
        }
    }
    
}
