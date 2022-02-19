//
//  ChangePasswordInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


class ChangePasswordInteractor {
    
    func changePassword (oldPassword : String , password : String , repeatedPassword : String , completion : @escaping CompletionHandler<ModelChangePassword>) {
        
        let data : [String : Any] = [
                "password": password,
                "password_repeated": repeatedPassword ,
                "old_password": oldPassword
        ]
        
        ApiClient<ModelChangePassword>.performRequest(route: .changePassword(data: data )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil , statusCode)
                return
            case .failure(let error ) :
                completion(nil , error , statusCode)
                return
            }
        }
    }
    
}
