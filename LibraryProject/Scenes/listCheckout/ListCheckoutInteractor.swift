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
    
    func getItem (item : String , completion : @escaping CompletionHandler<ModelItem>) {
        ApiClient<ModelItem>.performRequest(route: .getItemByItemID(itemID: item)) { result , statusCode in
            switch result {
            case .success(let data ) :
                completion(data , nil , statusCode)
                return
            case .failure(let error) :
                completion(nil , error , statusCode)
                return
            }
        }
    }
    
    func getBook (bibloID : String , completion : @escaping CompletionHandler<ModelBook>) {
        ApiClient<ModelBook>.performRequest(route: .getBibloItem(bibloID: bibloID )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion (data , nil , statusCode )
                return
            case .failure(let error) :
                completion(nil , error , statusCode )
                return
            }
        }
    }
    
    func getHoldList (completion : @escaping CompletionHandler<ModelListHold>) {
        ApiClient<ModelListHold>.performRequest(route: .getHoldList) { result , statusCode in
            switch result {
            case .success(let data ) :
                completion(data , nil , statusCode)
                return
            case .failure(let error) :
                completion (nil , error , statusCode)
                return
            }
        }
    }
    
}
