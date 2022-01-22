//
//  DetailBookInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


class DetailBookInteractor {
    
    func getBookDetails (bookID : Int , completion : @escaping CompletionHandler<ModelBook> ) {
        ApiClient<ModelBook>.performRequest(route: .getBookDetails(id: bookID )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil , statusCode)
                return
            case .error(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
