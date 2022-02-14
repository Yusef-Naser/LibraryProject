//
//  ListCheckoutInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//VC


class ListCheckoutInteractor {
    
    func getCheckoutList (completion : @escaping CompletionHandler<ModelCheckout>) {
        ApiClient<ModelCheckout>.performRequest(route: .getCheckoutList ) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .failure(let error) :
                completion(nil , error , statusCode)
                return
            }
        }
    }
}
