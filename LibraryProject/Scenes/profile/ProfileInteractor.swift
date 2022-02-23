//
//  ProfileInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC


class ProfileInteractor {
    
    func updateProfile (name : String , city : String , address : String , categoryID : String , libraryID : String , completion : @escaping CompletionHandler<ModelUser>) {
        
        let data : [String : Any] = [
            "surname":  name,
            "city":  city ,
            "address":  address ,
            "category_id": "S",
            "library_id": "ROST"
        ]
        
        ApiClient<ModelUser>.performRequest (route: .updateProfile(data: data)) { result , statusCode in
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
    
    
    func getLibraries (completion : @escaping CompletionHandler<ModelLibraries>) {
        ApiClient<ModelLibraries>.performRequest(route: .getLibraries ) { result , statusCode in
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
