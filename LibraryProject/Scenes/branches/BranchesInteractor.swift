//
//  BranchesInteractor.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

class BranchesInteractor {
    
    func getBranches (completion : @escaping CompletionHandler<ModelBranches>) {
        ApiClient<ModelBranches>.performRequest(route: .getBranches ) { result , statusCode in
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
    
}
