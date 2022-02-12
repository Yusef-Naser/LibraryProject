//
//  ModelSuggestions.swift
//  LibraryProject
//
//  Created by Yusef Naser on 12/02/2022.
//

struct ModelSuggestion: Codable {
    let acceptedBy, acceptedDate: String?
    let archived: Bool?
    let author: String?
    let biblioID, budgetID: String?
    let collectionTitle: String?
    let copyrightDate: Int?
    let currency: String?
    let isbn: String?
    let itemPrice: Double?
    let itemType: String?
    let lastStatusChangeBy, lastStatusChangeDate: String?
    let libraryID: String?
    let managedBy, managedDate: String?
    let note, patronReason, publicationPlace, publicationYear: String?
    let publisherCode, quantity: String?
    let reason, rejectedBy, rejectedDate: String?
    let status: String?
    let suggestedBy: Int?
    let suggestionDate: String?
    let suggestionID: Int?
    let timestamp: String?
    let title: String?
    let totalPrice, volumeDesc: String?

    enum CodingKeys: String, CodingKey {
        case acceptedBy = "accepted_by"
        case acceptedDate = "accepted_date"
        case archived, author
        case biblioID = "biblio_id"
        case budgetID = "budget_id"
        case collectionTitle = "collection_title"
        case copyrightDate = "copyright_date"
        case currency, isbn
        case itemPrice = "item_price"
        case itemType = "item_type"
        case lastStatusChangeBy = "last_status_change_by"
        case lastStatusChangeDate = "last_status_change_date"
        case libraryID = "library_id"
        case managedBy = "managed_by"
        case managedDate = "managed_date"
        case note
        case patronReason = "patron_reason"
        case publicationPlace = "publication_place"
        case publicationYear = "publication_year"
        case publisherCode = "publisher_code"
        case quantity, reason
        case rejectedBy = "rejected_by"
        case rejectedDate = "rejected_date"
        case status
        case suggestedBy = "suggested_by"
        case suggestionDate = "suggestion_date"
        case suggestionID = "suggestion_id"
        case timestamp, title
        case totalPrice = "total_price"
        case volumeDesc = "volume_desc"
    }
}

typealias ModelSuggestions = [ModelSuggestion]
