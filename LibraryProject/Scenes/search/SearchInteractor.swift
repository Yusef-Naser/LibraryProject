//
//  SearchInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC


class SearchInteractor {
    
    func getSearch (text : String , completion : @escaping CompletionHandler<ModelSearch>) {
        ApiClient<ModelSearch>.performRequest(route: .search(text: text )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .error(let error ) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
