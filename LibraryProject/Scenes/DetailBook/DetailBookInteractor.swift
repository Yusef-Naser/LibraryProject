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
    
    func addCheckout (completion : @escaping CompletionHandler<String>) {
        
        let data : [String : Any] = [
            
            "patron_id": "4",
            "barcode": "8262",
            "due_date":"2023-03-02",
            "issue_date":"2022-02-16"
            
        ]
        
        ApiClient<String>.performRequest(route: .addCheckout(data: data )) { result , statusCode in
            
        }
    }
    
}
