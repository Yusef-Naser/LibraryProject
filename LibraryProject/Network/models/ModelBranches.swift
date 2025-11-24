//
//  ModelBranches.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

struct ModelBranch: Codable {
    let address1: String
    let address2, address3: String?
    let city, country: String
    let email, fax, illEmail: String?
    let libraryID, name, postalCode, state: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, email, fax
        case illEmail = "ill_email"
        case libraryID = "library_id"
        case name
        case postalCode = "postal_code"
        case state, url
    }
}

typealias ModelBranches = [ModelBranch]
