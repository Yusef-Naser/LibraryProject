//
//  ModelSuggestedBooks.swift
//  LibraryProject
//
//  Created by yusef naser on 23/11/2025.
//

struct ModelSuggestedBooks: Codable {
    let status: Int?
    let message: String?
    let data: [ModelSuggestedBook]?
}

// MARK: - Datum
struct ModelSuggestedBook: Codable {
    let title, author, biblionumber: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case title, author, biblionumber
        case imageURL = "image_url"
    }
}
