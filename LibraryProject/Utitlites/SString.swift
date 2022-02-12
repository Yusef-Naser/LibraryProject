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
    static var email : String {return getText(key: "email")}
    static var password : String {return getText(key: "password")}
    static var bookDetails : String {return getText(key: "bookDetails")}
    static var publicationDetails : String {return getText(key: "publicationDetails")}
    static var subjects : String {return getText(key: "subjects")}
    static var DDCClassification : String {return getText(key: "DDCClassification")}
    static var description : String {return getText(key: "description")}
    static var changePassword : String {return getText(key: "changePassword")}
    static var profile : String {return getText(key: "profile")}
    static var update : String {return getText(key: "update")}
    static var name : String {return getText(key: "name")}
    static var cardNumber : String {return getText(key: "cardNumber")}
    static var address : String {return getText(key: "address")}
    static var menu : String {return getText(key: "menu")}
    static var checkoutList : String {return getText(key: "checkoutList")}
    static var suggestions : String {return getText(key: "suggestions")}
    static var addSuggest : String {return getText(key: "addSuggest")}
    
    
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
        "email" : "Email" ,
        "password" : "Password" ,
        "bookDetails" : "Book details" ,
        "publicationDetails" : "publication Details" ,
        "subjects" : "Subjects" ,
        "DDCClassification" : "DDC Classification" ,
        "description" : "Description" ,
        "changePassword" : "Change Password" ,
        "profile" : "Profile" ,
        "update" : "Update" ,
        "name" : "Name" ,
        "cardNumber" : "Card Number" ,
        "address" : "Address" ,
        "menu" : "Menu" ,
        "checkoutList" : "Checkout List" ,
        "suggestions" : "Suggestions" ,
        "addSuggest" : "Add Suggest" ,
    
    ]
    
}
