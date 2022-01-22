//
//  UserDefaultManager.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//

import Foundation

let Defaults = UserDefaults.standard

struct UserDefaultsManager {
    
    func setString(value: String, key: UserDefaultsKey) {
        Defaults.setValue(value, forKey: key.rawValue)
    }
    
    func setBool(value: Bool, key: UserDefaultsKey) {
        Defaults.set(value, forKey: key.rawValue)
    }
    
    func setBool(value: Bool, key: String) {
        Defaults.set(value, forKey: key)
    }
    
    func setInt(value: Int, key: String) {
        Defaults.set(value, forKey: key)
    }
    
    
    func getBool(key: String) -> Bool? {
        guard let saved =  Defaults.value(forKey: key) as? Bool else { return nil }
        return saved
    }
    
    func getInt(key: String) -> Int? {
        guard let saved =  Defaults.value(forKey: key) as? Int else { return nil }
        return saved
    }
    
    func getBool(key: UserDefaultsKey) -> Bool? {
        guard let saved =  Defaults.value(forKey: key.rawValue) as? Bool else { return nil }
        return saved
    }
    
    func getString(key: UserDefaultsKey) -> String? {
        guard let saved =  Defaults.value(forKey: key.rawValue) as? String else { return nil }
        return saved
    }
    
    func getString(key: String) -> String? {
        guard let saved =  Defaults.value(forKey: key) as? String else { return nil }
        return saved
    }
    
    func setModel<Model: Codable>(value: Model, key: UserDefaultsKey) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            Defaults.set(encoded, forKey: key.rawValue)
        }
    }
    
    func getModel<Model: Codable>(key: UserDefaultsKey) -> Model? {
        if let savedPerson = Defaults.object(forKey: key.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let loadedModel = try? decoder.decode(Model.self, from: savedPerson) {
                return loadedModel
            }
        }
        return nil
    }
    
    enum UserDefaultsKey: String {
        case localizationLanguage
    }
    
    func clearAllUserDefaults(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}
