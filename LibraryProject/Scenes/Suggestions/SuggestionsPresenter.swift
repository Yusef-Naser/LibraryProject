//
//  SuggestionsPresenter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


protocol ProSuggestionsView : StatusApi {
    func fetchSuggestions ()
}

protocol ProSuggestionsPresetner {

    func getSuggestions ()
    func suggestionCount () -> Int
    func getSuggest (index : Int) -> ModelSuggestion?
    
}


class SuggestionsPresenter : ProSuggestionsPresetner {
    
    weak var view : ProSuggestionsView?
    private let interactor = SuggestionsInteractor()
    
    private var listSuggestions = ModelSuggestions()
    
    init(view : ProSuggestionsView ) {
        self.view = view
    }
    
    func getSuggestions() {
        self.view?.showLoading()
        interactor.getSuggestions { data , error , statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.listSuggestions = data
            self.view?.fetchSuggestions()
        }
    }
    
    func suggestionCount() -> Int {
        self.listSuggestions.count
    }
    
    func getSuggest(index: Int) -> ModelSuggestion? {
        guard suggestionCount() > index else {
            return nil
        }
        return self.listSuggestions[index]
    }
}
