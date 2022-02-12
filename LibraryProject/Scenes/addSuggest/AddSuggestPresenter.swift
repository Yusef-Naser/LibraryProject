//
//  AddSuggestPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


protocol ProAddSuggestView : StatusApi {
    
}

protocol ProAddSuggestPresetner {

    
}


class AddSuggestPresenter : ProAddSuggestPresetner {
    
    weak var view : ProAddSuggestView?
    private let interactor = AddSuggestInteractor()
    
    init(view : ProAddSuggestView ) {
        self.view = view
    }
    
}
