//
//  FavoritesPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//VC


protocol ProFavoritesView : StatusApi {
    func fetchData ()
}

protocol ProFavoritesPresetner {

    func getFavorites()
    func getDataCount () -> Int
    func getItem (index : Int) -> ModelFavorite?
    
}


class FavoritesPresenter : ProFavoritesPresetner {
    
    weak var view : ProFavoritesView?
    private let interactor = FavoritesInteractor()
    private var listFavorite = [ModelFavorite]()
    
    init(view : ProFavoritesView ) {
        self.view = view
    }
    
    func getFavorites() {
        listFavorite = SharedData.instance.getFavorites()
        self.view?.fetchData()
    }
    
    func getDataCount() -> Int {
        listFavorite.count
    }
    
    func getItem(index: Int) -> ModelFavorite? {
        guard getDataCount() > index else {
            return nil
        }
        return listFavorite[index]
    }
    
}
