//
//  SearchInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//VC


class SearchInteractor {
    
    func getSearch (text : String , from : Int , to : Int , completion : @escaping CompletionHandler<ModelSearch>) {
        ApiClient<ModelSearch>.performRequest(route: .search(text: text , from : from , to : to  )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .failure(let error ) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
