//
//  ApiRouter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import Foundation
import Alamofire

//public protocol URLRequestConvertible {
//    func asURLRequest() -> URLRequest
//}

enum ApiRouter : URLRequestConvertible {
    
    case getHome
    case getBookDetails (id : Int)
    case search (text : String)
    case itemsBook (id : Int)
    case login (userName : String , password : String)
    case getCheckoutList
    case getSuggestions
    
    private var Methods : HTTPMethod {
        switch self {
        case .getHome , .getBookDetails , .search ,
             .itemsBook , .getCheckoutList , .getSuggestions :
            return .get
        case .login :
            return .post
        }
    }
    
    private var Headers : HTTPHeaders {
        switch self {
        case .getHome , .search , .login :
            return [
                "content-type" : "application/json;charset=utf-8",
            ]
        case .getBookDetails , .getCheckoutList , .getSuggestions :
            return [
                "Accept" : "application/marc-in-json" ,
                "Authorization": "Basic YXBwOkFwcFVzZXIyMDIy" ,
            ]
        case .itemsBook :
            return [:]
        }
    }
    private var Paths : String {
        switch self {
        case  .login  :
            return "https://library.awresidence.com/cgi-bin/koha/svc/authentication"
        case .getHome :
            return "https://library.awresidence.com/opac-tmpl/app.json?fbclid=IwAR3QYhQjJYoSpmAq3dyTIQPoHeRAKuFxFtkMsr0YmJGOEN-yTKC7n8rITAY"
        case .getBookDetails(let id ) :
            return "https://library.awresidence.com/api/v1/biblios/\(id)"
        case .itemsBook(let id ) :
            return "https://library.awresidence.com/api/v1/public/biblios/\(id)/items?fbclid=IwAR2abkzHyO_i7IRTjP9W-4hOLOauPiJlB4l2-5qXWuVtNx2QaOmpkUFxKjU"
        case .search(let text) :
            if text == "" {
                return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?startRecord=1&maximumRecords=10"
            }
            return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?query=\(text)&startRecord=1&maximumRecords=10"
            
        case .getCheckoutList :
            return "https://library.awresidence.com/api/v1/checkouts?patron_id=4"
            
        case .getSuggestions :
            return "https://library.awresidence.com/api/v1/suggestions"
        }
        
    }
    
    private var parameters : [String : Any] {
        switch self {
        case .getBookDetails , .getHome , .itemsBook , .search ,
             .getCheckoutList , .getSuggestions :
            return [:]
        case let .login(userName , password ) :
            return [
                "userid" : userName ,
                "password" : password
            ]
        }
    }
        
        func asURLRequest() throws -> URLRequest {
            //let url = "\(Constants.BaseURL)\(Paths)"
            let url = "\(Paths)"
            let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
            urlRequest.headers = Headers
            urlRequest.method = Methods
            
            if Methods != .get {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    }catch{
                throw AFError.parameterEncodingFailed(reason:.jsonEncodingFailed(error: error))
                    }
                }
            
            return urlRequest
        }
}
