//
//  ModelSearch.swift
//  LibraryProject
//
//  Created by Yusef Naser on 23/01/2022.
//

struct ModelSearch: Codable {
    let maximumRecords: String
    let facets: [Facet]
    let startRecord: String
    let records: [Record]
    let query: String
}

// MARK: - Facet
struct Facet: Codable {
    let facet: String
    let terms: [Term]
}

// MARK: - Term
struct Term: Codable {
    let name: String
    let count: Int
}

// MARK: - Record
struct Record: Codable {
    let edition, materialType, year: String
    let subjects: [String]
    let source, format, publisher, publicationPlace: String
    let title: String
    let authors: [String]
    let location, recordNumber: String

    enum CodingKeys: String, CodingKey {
        case edition
        case materialType = "material_type"
        case year, subjects, source, format, publisher
        case publicationPlace = "publication_place"
        case title, authors
        case location = "Location"
        case recordNumber = "record_number"
    }
}
