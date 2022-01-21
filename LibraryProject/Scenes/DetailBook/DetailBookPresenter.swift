//
//  DetailBookPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


protocol ProDetailBookView : StatusApi {
    
}

protocol ProDetailBookPresetner {

    
}


class DetailBookPresenter : ProDetailBookPresetner {
    
    weak var view : ProDetailBookView?
    private let interactor = DetailBookInteractor()
    
    init(view : ProDetailBookView ) {
        self.view = view
    }
    
}
