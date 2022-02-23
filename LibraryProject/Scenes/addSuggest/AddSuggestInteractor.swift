//
//  AddSuggestInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


class AddSuggestInteractor {
    
    func addSuggest (title : String , author : String , copyRightDate : String ,
                     publisher : String , collectionTitle : String ,
                     publicationPlace : String , quantity : String , itemType : String ,
                     library : String , notes : String , completion : @escaping CompletionHandler<ModelSuggestion>) {
        let data : [String : Any] = [
            "title" : title ,
            "note" : notes ,
            "author" : author ,
            "copyright_date" : copyRightDate ,
            "publication_place" : publicationPlace ,
            "item_type" : itemType ,
            "quantity" : quantity ,
            "collection_title" : collectionTitle ,
            "library_id" : library ,
            "publisher_code" : publisher 
            
        ]
        ApiClient<ModelSuggestion>.performRequest(route: .addSuggest(data: data )) { result , statusCode in
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
