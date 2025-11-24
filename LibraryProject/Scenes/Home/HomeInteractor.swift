//
//  HomeInteractor.swift
//  Library
//
//  Created by yusef naser on 18/01/2022.
//VC


class HomeInteractor {
    
    func getFeatured (completion : @escaping CompletionHandler<ModelFeatured> ) {
        ApiClient<ModelFeatured>.performRequest(route: .getfeatured) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
    func getLatest (completion : @escaping CompletionHandler<ModelArrayLatest> ) {
        ApiClient<ModelArrayLatest>.performRequest(route: .getLatest) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil , statusCode)
                return
            case .failure(let error) :
                completion(nil , error , statusCode)
                return
            }
        }
    }
    
    func getSuggestedBooks (completion : @escaping CompletionHandler<ModelSuggestedBooks> ) {
        ApiClient<ModelSuggestedBooks>.performRequest(route: .getSuggestedBooks) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil , statusCode)
                return
            case .failure(let error) :
                completion(nil , error , statusCode)
                return
            }
        }
    }
    
}
