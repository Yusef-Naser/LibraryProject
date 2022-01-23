//
//  ApiRouter.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import Foundation


public protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

enum ApiRouter : URLRequestConvertible {
    
    case getHome
    case getBookDetails (id : Int)
    case search (text : String)
    
    private var Methods : String {
        switch self {
        case .getHome , .getBookDetails , .search  :
            return "GET"
        }
    }
    
    private var Headers : [String : String] {
        switch self {
        case .getHome , .search :
            return [
                "content-type" : "application/json;charset=utf-8",
            ]
        case .getBookDetails :
            return [
                "Accept" : "application/marc-in-json" ,
            ]
        }
    }
    private var Paths : String {
        switch self {
        case .getHome :
            return "https://library.awresidence.com/opac-tmpl/app.json?fbclid=IwAR3QYhQjJYoSpmAq3dyTIQPoHeRAKuFxFtkMsr0YmJGOEN-yTKC7n8rITAY"
        case .getBookDetails(let id ) :
            return "https://library.awresidence.com/api/v1/public/biblios/\(id)"
        case .search(let text) :
            if text == "" {
                return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?startRecord=1&maximumRecords=10"
            }
            return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?query=\(text)&startRecord=1&maximumRecords=10"
        }
        
    }
        
        func asURLRequest() -> URLRequest {
            //let url = "\(Constants.BaseURL)\(Paths)"
            let url = "\(Paths)"
            let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
            urlRequest.allHTTPHeaderFields = Headers
            return urlRequest
        }
}
