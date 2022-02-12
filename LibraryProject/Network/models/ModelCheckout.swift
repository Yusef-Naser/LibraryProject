//
//  ModelCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

struct ModelCheckoutElement: Codable {
    let autoRenew: Bool
    let autoRenewError, checkinDate: String?
    let checkoutDate: String?
    let checkoutID: Int?
    let dueDate: String?
    let issuerID: StringIntValue?
    let itemID: Int?
    let lastRenewedDate: String?
    let libraryID: String
    let note, noteDate: String?
    let noteSeen, onsiteCheckout: Bool?
    let patronID, renewals: Int?
    let timestamp: String?
    let unseenRenewals: Int?

    enum CodingKeys: String, CodingKey {
        case autoRenew = "auto_renew"
        case autoRenewError = "auto_renew_error"
        case checkinDate = "checkin_date"
        case checkoutDate = "checkout_date"
        case checkoutID = "checkout_id"
        case dueDate = "due_date"
        case issuerID = "issuer_id"
        case itemID = "item_id"
        case lastRenewedDate = "last_renewed_date"
        case libraryID = "library_id"
        case note
        case noteDate = "note_date"
        case noteSeen = "note_seen"
        case onsiteCheckout = "onsite_checkout"
        case patronID = "patron_id"
        case renewals, timestamp
        case unseenRenewals = "unseen_renewals"
    }
}

typealias ModelCheckout = [ModelCheckoutElement]
