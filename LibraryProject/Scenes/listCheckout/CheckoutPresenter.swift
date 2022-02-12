//
//  CheckoutPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//VC


protocol ProCheckoutView : StatusApi {
    
}

protocol ProCheckoutPresetner {

    
}


class CheckoutPresenter : ProCheckoutPresetner {
    
    weak var view : ProCheckoutView?
    private let interactor = CheckoutInteractor()
    
    init(view : ProCheckoutView ) {
        self.view = view
    }
    
}
