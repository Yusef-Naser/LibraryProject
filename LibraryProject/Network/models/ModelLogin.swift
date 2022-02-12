//
//  ModelLogin.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/01/2022.
//

// MARK: - ModelLogin
struct ModelLogin: Codable {
    let encoding, version: String?
    let response: Response?

    enum CodingKeys: String, CodingKey {
        case encoding = "@encoding"
        case version = "@version"
        case response
    }
}

// MARK: - Response
struct Response: Codable {
    let status , borrowerid : Status?
}

// MARK: - Status
struct Status: Codable {
    let t: String?

    enum CodingKeys: String, CodingKey {
        case t = "$t"
    }
}
