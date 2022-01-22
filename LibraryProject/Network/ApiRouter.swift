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
    
    private var Methods : String {
        switch self {
        case .getHome  :
            return "GET"
        }
    }
    
    private var Headers : [String : String] {
        switch self {
        case .getHome  :
            return [
                "content-type" : "application/json;charset=utf-8",
            ]
        }
    }
    private var Paths : String {
        switch self {
        case .getHome :
            return "https://library.awresidence.com/opac-tmpl/app.json?fbclid=IwAR3QYhQjJYoSpmAq3dyTIQPoHeRAKuFxFtkMsr0YmJGOEN-yTKC7n8rITAY"
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
