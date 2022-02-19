//
//  AddSuggestPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


protocol ProAddSuggestView : StatusApi {
    
}

protocol ProAddSuggestPresetner {

    func addSuggest (title : String)
    
}


class AddSuggestPresenter : ProAddSuggestPresetner {
    
    weak var view : ProAddSuggestView?
    private let interactor = AddSuggestInteractor()
    
    init(view : ProAddSuggestView ) {
        self.view = view
    }
    
    func addSuggest(title: String) {
        interactor.addSuggest(title: title) { data , error, statusCode in
            
        }
    }
}
