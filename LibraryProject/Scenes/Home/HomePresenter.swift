//
//  HomePresenter.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


protocol ProHomeView : StatusApi {
    
}

protocol ProHomePresetner {

    
}


class HomePresenter : ProHomePresetner {
    
    weak var view : ProHomeView?
    private let interactor = HomeInteractor()
    
    init(view : ProHomeView ) {
        self.view = view
    }
    
}
