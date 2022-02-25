//
//  ModelProfile.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//

import Foundation

struct ModelProfile: Codable {
    let categoryID : String?
    let libraryID: String?
    let surname, title: String?
    let userid: String?
    let city: String?
    let address : String?


    enum CodingKeys: String, CodingKey {
        
        case categoryID = "category_id"
        case libraryID = "library_id"
        case surname, title
        case userid , city , address
        
    }
}
