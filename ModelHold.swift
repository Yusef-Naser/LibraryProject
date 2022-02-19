//
//  ModelHold.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/02/2022.
//

struct ModelHold: Codable {
    let biblioID: Int?
    let deskID : StringIntValue?
    let cancellationDate, cancellationReason, expirationDate: String?
    let holdDate: String?
    let holdID: Int?
    let itemID: StringIntValue?
    let itemLevel: Bool?
    let itemType: String?
    let lowestPriority, nonPriority: Bool?
    let notes: String?
    let patronID: Int?
    let pickupLibraryID: String?
    let priority: Int?
    let status: String?
    let suspended: Bool?
    let suspendedUntil: String?
    let timestamp: String?
    let waitingDate: String?
    let error : String?

    enum CodingKeys: String, CodingKey {
        case biblioID = "biblio_id"
        case cancellationDate = "cancellation_date"
        case cancellationReason = "cancellation_reason"
        case deskID = "desk_id"
        case expirationDate = "expiration_date"
        case holdDate = "hold_date"
        case holdID = "hold_id"
        case itemID = "item_id"
        case itemLevel = "item_level"
        case itemType = "item_type"
        case lowestPriority = "lowest_priority"
        case nonPriority = "non_priority"
        case notes
        case patronID = "patron_id"
        case pickupLibraryID = "pickup_library_id"
        case priority, status, suspended
        case suspendedUntil = "suspended_until"
        case timestamp
        case waitingDate = "waiting_date"
        case error
    }
}
