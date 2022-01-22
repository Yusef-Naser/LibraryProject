//
//  HomeInteractor.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


class HomeInteractor {
    
    func getHome (completion : @escaping CompletionHandler<ModelHome> ) {
        ApiClient<ModelHome>.performRequest(route: .getHome) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .error(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}