//
//  ProfileInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


class ProfileInteractor {
    
    func updateProfile (completion : @escaping CompletionHandler<String>) {
        
        let data : [String : Any] = [
            "surname": "app20222    gg   ",
            "city": "Damietta",
            "address": "yes it work",
            "category_id": "S",
            "library_id": "ROST"
        ]
        
        ApiClient<String>.performRequestString(route: .updateProfile(data: data)) { result  in
            print(result.result)
        }
    }
    
}
