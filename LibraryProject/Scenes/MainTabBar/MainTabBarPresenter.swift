//
//  MainTabBarPresenter.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


protocol ProMainTabBarView : StatusApi {
    
}

protocol ProMainTabBarPresetner {

    
}


class MainTabBarPresenter : ProMainTabBarPresetner {
    
    weak var view : ProMainTabBarView?
    private let interactor = MainTabBarInteractor()
    
    init(view : ProMainTabBarView ) {
        self.view = view
    }
    
}
