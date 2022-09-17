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
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
    func getItemsBook (id : Int , completion : @escaping CompletionHandler<ModelItemsBookArray>) {
        ApiClient<ModelItemsBookArray>.performRequest(route: .itemsBook(id: id )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion( data , nil, statusCode)
                return
            case .failure(let error) :
                completion(nil, error , statusCode)
                return
            }
        }
    }
    
   
    
    func addHold (biblioID : Int , libraryID : String , completion : @escaping CompletionHandler<ModelHold>) {
        let data : [String : Any] = [
                "patron_id":SharedData.instance.getUserID(),
                "pickup_library_id":"ROST",
                "biblio_id":biblioID
        ]
        ApiClient<ModelHold>.performRequest(route: .addHold(data: data )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil , statusCode)
                return
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
        
    }
    
    func getLibraryName (code : String , completion : @escaping CompletionHandler <ModelLibrary>) {
        ApiClient<ModelLibrary>.performRequest(route: .getLibrary(code: code )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil , statusCode)
                return
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
