//
//  SString.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

struct SString {
    
    static var filter : String { return getText(key: "filter") }
    static var search : String {return getText(key: "search")}
    static var viewAll : String {return getText(key: "viewAll")}
    static var newBooks : String {return getText(key: "newBooks")}
    static var featureBooks : String {return getText(key: "featureBooks")}
    static var login : String {return getText(key: "login")}
    
    
    private static func getText (key : String) -> String {
        dicEN[key] ?? key
    }
  
    private static let dicEN : [String : String] = [
        "filter" : "Filter" ,
        "search" : "Search" ,
        "viewAll" : "View all" ,
        "newBooks" : "New books" ,
        "featureBooks" : "Feature books" ,
        "login" : "Login" ,
    
    ]
    
}
