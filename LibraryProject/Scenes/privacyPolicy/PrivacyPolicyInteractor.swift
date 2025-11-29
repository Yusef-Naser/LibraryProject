//
//  PrivacyPolicyInteractor.swift
//  LibraryProject
//
//  Created by yusef naser on 29/11/2025.
//

class PrivacyPolicyInteractor {
    
    func getPrivacyPolicy (completion : @escaping CompletionHandler<ModelPrivacyPolicy>) {
        ApiClient<ModelPrivacyPolicy>.performRequest(route: .privacyPolicy) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil , statusCode)
                return
            case .failure(let error) :
                completion(nil , error, statusCode)
                return
            }
        }
    }
    
}
