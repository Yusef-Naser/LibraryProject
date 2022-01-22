//
//  SearchPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC


protocol ProSearchView : StatusApi {
    
}

protocol ProSearchPresetner {

    
}


class SearchPresenter : ProSearchPresetner {
    
    weak var view : ProSearchView?
    private let interactor = SearchInteractor()
    
    init(view : ProSearchView ) {
        self.view = view
    }
    
}
