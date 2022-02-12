//
//  LoginInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//VC


class LoginInteractor {
    
    func login (userName : String , password : String , completion : @escaping CompletionHandler<ModelLogin>) {
        ApiClient<ModelLogin>.performRequest(route: .login(userName: userName , password: password )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil , statusCode)
                return
            case .failure(let error ) :
                completion(nil , error, statusCode)
                return
            }
        }
        
        ApiClient<ModelLogin>.performRequestString(route: .login(userName: userName, password: password)) { result in
            print(result.result)
        }
        
    }
    
}
