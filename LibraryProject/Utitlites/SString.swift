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
    static var title : String { return getText(key: "title")}
    static var author : String { return getText(key: "author")}
    static var copyrightDate : String { return getText(key: "copyrightDate")}
    static var publisher : String { return getText(key: "publisher")}
    static var collectionTitle : String { return getText(key: "collectionTitle")}
    static var publicationPlace : String { return getText(key: "publicationPlace")}
    static var quantity : String { return getText(key: "quantity")}
    static var itemType : String { return getText(key: "itemType")}
    static var library : String { return getText(key: "library")}
    static var notes : String { return getText(key: "notes")}
    static var submit : String { return getText(key: "submit")}
    static var holdList : String { return getText(key: "holdList")}
    static var addCheckout : String { return getText(key: "addCheckout")}
    static var city : String { return getText(key: "city")}
    static var categoryID : String { return getText(key: "categoryID")}
    static var libraryID : String { return getText(key: "libraryID")}
    static var repeatedPassword : String { return getText(key: "repeatedPassword")}
    static var oldPassword : String { return getText(key: "oldPassword")}
    static var addHold : String {return getText(key: "addHold")}
    static var logout : String {return getText(key: "logout")}
    static var checkin : String {return getText(key: "checkin")}
    static var checkout : String {return getText(key: "checkout")}
    static var close : String {return getText(key: "close")}
    
    
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
        "title" : "Title" ,
        "author" : "Author" ,
        "copyrightDate" : "Copyright Date" ,
        "publisher" : "Publisher" ,
        "collectionTitle" : "Collection title" ,
        "publicationPlace" : "Publication Place" ,
        "quantity" : "Quantity" ,
        "itemType" : "Item type" ,
        "library" : "Library" ,
        "notes" : "Notes" ,
        "submit" : "Submit" ,
        "holdList" : "Hold List" ,
        "addCheckout" : "Add Checkout" ,
        "city" : "City" ,
        "categoryID" : "Category ID" ,
        "libraryID" : "Library ID" ,
        "repeatedPassword" : "Repeated Password" ,
        "oldPassword" : "Old Password" ,
        "addHold" : "Add hold" ,
        "logout" : "Logout" ,
        "checkin" : "Checkin" ,
        "checkout" : "checkout",
        "close" : "Close" ,
    ]
    
}
