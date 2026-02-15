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
var BASEURL = "https://twk.alzad.ae"
var SECOND_BASEURL = "https://alriwaq.tawazun.gov.ae"
var BASEIMAGEURL : ((String) -> String) = { str in
    return "\(BASEURL)/cgi-bin/koha/opac-image.pl?biblionumber=\(str)"
}
var COVER_IMAGE_URL : ((String) -> String) = { str in
    return "\(SECOND_BASEURL)\(str)"
}
enum ApiRouter : URLRequestConvertible {
    
    case getMostRead
    case getLatest
    case getSuggestedBooks
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
    case getBranches
    case privacyPolicy
    
    
    private var Methods : HTTPMethod {
        switch self {
        case .getMostRead , .getBookDetails , .search ,
             .itemsBook , .getCheckoutList , .getSuggestions ,
             .getItemByItemID , .getBibloItem  ,
             .getHoldList , .login , .getLibrary ,.getLibraries , .getProfile ,
             .getLatest , .getSuggestedBooks , .getBranches , .privacyPolicy :
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
        case .getMostRead , .getLatest , .getSuggestedBooks , .search , .login ,
                .getBranches , .privacyPolicy:
            return [
                "content-type" : "application/json;charset=utf-8",
            ]
        case .getBookDetails ,
                .getBibloItem  ,
                .addCheckout , .removeCheckout , .getLibrary  :
            return [
                "Accept" : "application/marc-in-json" ,
                "Authorization" : "Basic \(SharedData.instance.getBase64())"
              //  "Authorization": "Basic YXBwOkFwcFVzZXIyMDIy" , //app:AppUser2022
               // "Authorization": "Basic YXBwOkFwcFVzZXIyMDIx" //app:AppUser2021
            ]
        case .itemsBook , .getProfile , .addHold , .getLibraries ,
                .getCheckoutList , .getHoldList , .getSuggestions , .updateProfile ,
                .addSuggest , .changePassword , .getItemByItemID :
            return [
                "Content-Type" : "application/json" ,
                "Accept" : "application/json" ,
                "Authorization" : "Basic \(SharedData.instance.getBase64())"
            ]
        }
    }
    private var Paths : String {
        
        let userID = SharedData.instance.getUserID()
        
        switch self {
        case  .login(let data )  :
            let user = data ["userid"] ?? ""
            let pass = data ["password"] ?? ""
            return "\(BASEURL)/cgi-bin/koha/svc/authentication?userid=\(user)&password=\(pass)"
        case .getMostRead :
            return "\(SECOND_BASEURL)/api/categories/Popular-Titles"
        case .getLatest :
            return "\(BASEURL)/cgi-bin/koha/latestbooks.pl"
        case .getSuggestedBooks:
            return "\(SECOND_BASEURL)/api/suggested-books"
        case .getBookDetails(let id ) :
            return "\(BASEURL)/api/v1/public/biblios/\(id)"
        case .itemsBook(let id ) :
            return "\(BASEURL)/api/v1/public/biblios/\(id)/items"
        case let .search( text , from  , to ) :
            if text == "" {
                return "\(BASEURL)/cgi-bin/koha/opac-sru-facets.pl?startRecord=1&maximumRecords=10"
            }
            return "\(BASEURL)/cgi-bin/koha/opac-sru-facets.pl?query=\(text)&startRecord=\(from)&maximumRecords=\(to)"
            
        case .getCheckoutList :
            return "\(BASEURL)/api/v1/checkouts?patron_id=\(userID)"
            
        case .getSuggestions :
            return "\(BASEURL)/api/v1/suggestions"
            
        case .updateProfile :
            return "\(BASEURL)/api/v1/patrons/\(userID)"
            
        case .addSuggest :
            return "\(BASEURL)/api/v1/suggestions"
        case .getItemByItemID(let itemID) :
            return "\(BASEURL)/api/v1/items/\(itemID)"
        case .getBibloItem(let bibloID ) :
          //  return "\(BASEURL)/api/v1/public/biblios/\(bibloID)"  // return ModelBook
        return "\(BASEURL)/api/v1/biblios/\(bibloID)"// return ModelBookV2
        case .getHoldList :
            return "\(BASEURL)/api/v1/holds?patron_id=\(userID)"
        case .addCheckout :
            return "\(BASEURL)/api/v1/checkouts"
        case .removeCheckout :
            return "\(BASEURL)/api/v1/checkin"
        case .changePassword :
            return "\(BASEURL)/api/v1/public/patrons/\(userID)/password"
        case .addHold :
            return "\(BASEURL)/api/v1/holds"
        case .getLibrary(let code) :
            return "\(BASEURL)/api/v1/public/libraries/\(code)"
        case .getLibraries :
            return "\(BASEURL)/api/v1/libraries"
        case .getProfile :
            return "\(BASEURL)/api/v1/patrons/\(SharedData.instance.getUserID())"
        case .getBranches:
            return "\(BASEURL)/api/v1/public/libraries"
        case .privacyPolicy:
            return "\(SECOND_BASEURL)/api/pages/privacy"
        }
        
    }
    
    private var parameters : [String : Any] {
        switch self {
        case .getBookDetails , .getMostRead , .getSuggestedBooks , .itemsBook , .search ,
                .getCheckoutList , .getSuggestions , .getItemByItemID ,
                .getBibloItem , .getHoldList ,.getLibrary , .getLibraries , .getProfile ,
                .getLatest , .getBranches , .privacyPolicy  :
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
