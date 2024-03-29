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
    case getLatest
    case getBookDetails (id : Int)
    case search (text : String , from : Int , to : Int )
    case itemsBook (id : Int)
    case login (data : [String : Any])
    case getCheckoutList
    case getSuggestions
    case updateProfile (data : [String : Any])
    case addSuggest (data : [String : Any])
    case getItemByItemID (itemID : String)
    case getBibloItem (bibloID : String)
    case getHoldList
    case addCheckout (data : [String : Any])
    case removeCheckout (data : [String : Any])
    case changePassword (data : [String : Any])
    case addHold (data : [String : Any])
    case getLibrary(code : String)
    case getLibraries
    case getProfile
    
    
    private var Methods : HTTPMethod {
        switch self {
        case .getHome , .getBookDetails , .search ,
             .itemsBook , .getCheckoutList , .getSuggestions ,
             .getItemByItemID , .getBibloItem  ,
             .getHoldList , .login , .getLibrary ,.getLibraries , .getProfile ,
             .getLatest :
            return .get
        case .addSuggest , .addCheckout , .removeCheckout ,
             .changePassword , .addHold :
            return .post
        case .updateProfile :
            return .put
        }
    }
    
    private var Headers : HTTPHeaders {
        switch self {
        case .getHome , .getLatest  , .search , .login  :
            return [
                "content-type" : "application/json;charset=utf-8",
            ]
        case .getBookDetails , .getCheckoutList , .getSuggestions ,
                .updateProfile , .addSuggest , .itemsBook ,
                .getItemByItemID , .getBibloItem , .getHoldList ,
                .addCheckout , .removeCheckout , .changePassword ,
                .addHold , .getLibrary  , .getLibraries , .getProfile :
            return [
                "Accept" : "application/marc-in-json" ,
                "Authorization" : "Basic \(SharedData.instance.getBase64())"
              //  "Authorization": "Basic YXBwOkFwcFVzZXIyMDIy" , //app:AppUser2022
               // "Authorization": "Basic YXBwOkFwcFVzZXIyMDIx" //app:AppUser2021
            ]
      //  case .itemsBook :
       //     return [:]
        }
    }
    private var Paths : String {
        
        let userID = SharedData.instance.getUserID()
        
        switch self {
        case  .login(let data )  :
            let user = data ["userid"] ?? ""
            let pass = data ["password"] ?? ""
            return "https://library.awresidence.com/cgi-bin/koha/svc/authentication?userid=\(user)&password=\(pass)"
        case .getHome :
            return "https://library.awresidence.com/opac-tmpl/app.json?fbclid=IwAR3QYhQjJYoSpmAq3dyTIQPoHeRAKuFxFtkMsr0YmJGOEN-yTKC7n8rITAY"
        case .getLatest :
            return "https://library.awresidence.com/cgi-bin/koha/latestbooks.pl"
        case .getBookDetails(let id ) :
            return "https://library.awresidence.com/api/v1/biblios/\(id)"
        case .itemsBook(let id ) :
            return "https://library.awresidence.com/api/v1/biblios/\(id)/items"
        case let .search( text , from  , to ) :
            if text == "" {
                return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?startRecord=1&maximumRecords=10"
            }
            return "https://library.awresidence.com/cgi-bin/koha/opac-sru.pl?query=\(text)&startRecord=\(from)&maximumRecords=\(to)"
            
        case .getCheckoutList :
            return "https://library.awresidence.com/api/v1/checkouts?patron_id=\(userID)"
            
        case .getSuggestions :
            return "https://library.awresidence.com/api/v1/suggestions"
            
        case .updateProfile :
            return "https://library.awresidence.com/api/v1/patrons/\(userID)"
            
        case .addSuggest :
            return "https://library.awresidence.com/api/v1/suggestions"
        case .getItemByItemID(let itemID) :
            return "https://library.awresidence.com/api/v1/items/\(itemID)"
        case .getBibloItem(let bibloID ) :
          //  return "https://library.awresidence.com/api/v1/public/biblios/\(bibloID)"  // return ModelBook
        return "https://library.awresidence.com/api/v1/biblios/\(bibloID)"// return ModelBookV2
        case .getHoldList :
            return "https://library.awresidence.com/api/v1/holds?patron_id=\(userID)"
        case .addCheckout :
            return "https://library.awresidence.com/api/v1/checkouts"
        case .removeCheckout :
            return "https://library.awresidence.com/api/v1/checkin"
        case .changePassword :
            return "https://library.awresidence.com/api/v1/public/patrons/\(userID)/password"
        case .addHold :
            return "https://library.awresidence.com/api/v1/holds"
        case .getLibrary(let code) :
            return "https://library.awresidence.com/api/v1/public/libraries/\(code)"
        case .getLibraries :
            return "https://library.awresidence.com/api/v1/libraries"
        case .getProfile :
            return "https://library.awresidence.com/api/v1/patrons/\(SharedData.instance.getUserID())"
        }
        
    }
    
    private var parameters : [String : Any] {
        switch self {
        case .getBookDetails , .getHome , .itemsBook , .search ,
                .getCheckoutList , .getSuggestions , .getItemByItemID ,
                .getBibloItem , .getHoldList ,.getLibrary , .getLibraries , .getProfile ,
                .getLatest :
            return [:]
        case .updateProfile(let data ) , .addSuggest(let data ) ,
                .addCheckout(let data) , .changePassword(let data ) ,
                .addHold(let data ) , .login( let data ) , .removeCheckout(let data ):
            return data 
      
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
