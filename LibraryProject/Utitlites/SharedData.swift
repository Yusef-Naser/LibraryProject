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
        guard getBase64() == "" else {
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
    
}
