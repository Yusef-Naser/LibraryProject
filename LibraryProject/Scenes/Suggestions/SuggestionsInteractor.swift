//
//  SuggestionsInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


class SuggestionsInteractor {
    
    func getSuggestions (completion : @escaping CompletionHandler<ModelSuggestions>) {
        ApiClient<ModelSuggestions>.performRequest(route: .getSuggestions ) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil , statusCode)
                return
            case .failure(let error) :
                completion(nil ,error ,statusCode)
                return
            }
        }
    }
    
}
