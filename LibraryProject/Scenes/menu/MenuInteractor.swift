//
//  MenuInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 04/02/2022.
//VC

import Foundation

class MenuInteractor {
    
    func addCheckout (barcode : String , completion : @escaping CompletionHandler<ModelAddCheckout>) {
        
        let data : [String : Any] = [
            
            "patron_id": "\(SharedData.instance.getUserID())",
            "barcode": barcode ,
            "due_date": Date().getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 6),
            "issue_date":Date().getDateString(formate: "yyyy-MM-dd", afterPeriodOfMonths: 0)
            
        ]
        
        ApiClient<ModelAddCheckout>.performRequest(route: .addCheckout(data: data )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil, statusCode)
                return
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
    func removeCheckout (barcode : String , completion : @escaping CompletionHandler<String>) {
        
        let data : [String : Any] = [
            
            "patron_id": "\(SharedData.instance.getUserID())",
            "barcode": barcode
            
        ]
        
        ApiClient<String>.performRequest(route: .removeCheckout(data: data )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data ,nil, statusCode)
                return
            case .failure(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
