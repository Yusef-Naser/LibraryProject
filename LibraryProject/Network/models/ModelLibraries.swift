//
//  ModelLibraries.swift
//  LibraryProject
//
//  Created by Yusef Naser on 23/02/2022.
//

struct ModelLibrary : Codable {
    let libraryID, name: String?

    enum CodingKeys: String, CodingKey {
        case libraryID = "library_id"
        case name
    }
}

typealias ModelLibraries = [ModelLibrary]
