//
//  MenuPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


protocol ProMenuView : StatusApi {
    
}

protocol ProMenuPresetner {

    
    
}


class MenuPresenter : ProMenuPresetner {
    
    weak var view : ProMenuView?
    private let interactor = MenuInteractor()
    
    init(view : ProMenuView ) {
        self.view = view
    }
    
}
