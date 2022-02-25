//
//  SharedData.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/02/2022.
//

import Foundation

class SharedData {
    
    private var userDefault = UserDefaults.standard
    static var instance = SharedData()
    
    private let USER_ID = "USER_KEY"
    private let GETAUTH = "GET_AUTH"
    private let USER_NAME = "USER_NAME"
    private let CATEGORIES = "Categories"
    private let FAVORITE_KEY = "FavoriteKey"
    
    func setUserID (id : Int?) {
        userDefault.setValue(id , forKey: USER_ID)
    }
    func getUserID () -> Int {
        userDefault.integer(forKey: USER_ID)
    }
    
    func removeData() {
        userDefault.removeObject(forKey: USER_ID)
        userDefault.removeObject(forKey: GETAUTH)
        userDefault.removeObject(forKey: USER_NAME)
    }
    
    func setBase64 (user : String , pass : String) {
        userDefault.removeObject(forKey: GETAUTH)
        let data = "\(user):\(pass)"
        userDefault.setValue(user , forKey: USER_NAME)
        let utf8str = data.data(using: .utf8 , allowLossyConversion: false )
        if let base64Encoded = utf8str?.base64EncodedString(options: .init(rawValue: 0))
        {
            userDefault.setValue(base64Encoded, forKey: GETAUTH)
        }
    }
    
    func setNewPassword (pass : String) {
        guard getBase64() != "" else {
            return
        }
        let user = userDefault.string(forKey: USER_NAME)
        if let user = user , user != "" {
            setBase64(user: user , pass: pass)
        }
    }
    
    func getBase64 () -> String {
        userDefault.string(forKey: GETAUTH) ?? ""
    }
    
    func setCategories (categories : [String:String]?) {
        guard let c = categories else {
            return
        }
        userDefault.removeObject(forKey: CATEGORIES)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(c) {
            userDefault.set( encoded , forKey: CATEGORIES )
        }
    }
    
    func getCategories () -> [String:String]? {
        if let categoreis = userDefault.data(forKey: CATEGORIES) {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([String:String].self, from: categoreis) {
                return loadedPerson
            }
        }
        return nil
    }
    
    
    func setFavorite (favorite : ModelFavorite) {
        var array = getFavorites()
        array.append(favorite)
        userDefault.removeObject(forKey: FAVORITE_KEY)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            userDefault.set( encoded , forKey: FAVORITE_KEY )
        }
    }
    
    func getFavorites () -> [ModelFavorite] {
        if let favorites = userDefault.data(forKey: FAVORITE_KEY) {
            let decoder = JSONDecoder()
            if let favoritesArray = try? decoder.decode( [ModelFavorite].self, from: favorites) {
                return favoritesArray
            }
        }
        return []
    }
    func removeFavorite (id : Int) {
        var array = getFavorites()
        guard let index = array.firstIndex(where: {$0.id == id}) else {
            return
        }
        array.remove(at: index)
        userDefault.removeObject(forKey: FAVORITE_KEY)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            userDefault.set( encoded , forKey: FAVORITE_KEY )
        }
    }
}
