//
//  AddSuggestInteractor.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//VC


class AddSuggestInteractor {
    
    func addSuggest (title : String , completion : @escaping CompletionHandler<String>) {
        let data : [String : Any] = [
            "title" : title
        ]
        ApiClient<String>.performRequestString(route: .addSuggest(data: data )) { result  in
            print(result.result)
        }
    }
    
}
