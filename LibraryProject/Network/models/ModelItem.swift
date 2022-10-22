//
//  ModelItem.swift
//  LibraryProject
//
//  Created by yusef naser on 15/02/2022.
//

struct ModelItem: Codable {
    let acquisitionDate: String?
    let acquisitionSource: String?
    let biblioID: Int?
    let callNumberSort, callNumberSource, callnumber, checkedOutDate: String?
    let checkoutsCount: Int?
    let codedLocationQualifier, collectionCode, copyNumber : StringIntValue?
    let damagedDate: String?
    
    let damagedStatus: Int?
    let excludeFromLocalHoldsPriority: Bool?
    let extendedSubfields: String?
    let externalID, holdingLibraryID: String?
    let holdsCount: Int?
    let homeLibraryID: String?
    let internalNotes : String?
    let inventoryNumber: Int?
    let itemID: Int?
    let itemTypeID, lastCheckoutDate, lastSeenDate: String?
    let location, lostDate: String?
    let lostStatus: Int?
    let materialsNotes, newStatus: String?
    let notForLoanStatus: Int?
    let permanentLocation, publicNotes : String?
    let purchasePrice, renewalsCount: Double?
    let replacementPrice: Double?
    let replacementPriceDate: String?
    let restrictedStatus : String?
    let serialIssueNumber: Int?
    let timestamp: String?
    let uri: String?
    let withdrawn: Int?
    let withdrawnDate: String?

    enum CodingKeys: String, CodingKey {
        case acquisitionDate = "acquisition_date"
        case acquisitionSource = "acquisition_source"
        case biblioID = "biblio_id"
        case callNumberSort = "call_number_sort"
        case callNumberSource = "call_number_source"
        case callnumber
        case checkedOutDate = "checked_out_date"
        case checkoutsCount = "checkouts_count"
        case codedLocationQualifier = "coded_location_qualifier"
        case collectionCode = "collection_code"
        case copyNumber = "copy_number"
        case damagedDate = "damaged_date"
        case damagedStatus = "damaged_status"
        case excludeFromLocalHoldsPriority = "exclude_from_local_holds_priority"
        case extendedSubfields = "extended_subfields"
        case externalID = "external_id"
        case holdingLibraryID = "holding_library_id"
        case holdsCount = "holds_count"
        case homeLibraryID = "home_library_id"
        case internalNotes = "internal_notes"
        case inventoryNumber = "inventory_number"
        case itemID = "item_id"
        case itemTypeID = "item_type_id"
        case lastCheckoutDate = "last_checkout_date"
        case lastSeenDate = "last_seen_date"
        case location
        case lostDate = "lost_date"
        case lostStatus = "lost_status"
        case materialsNotes = "materials_notes"
        case newStatus = "new_status"
        case notForLoanStatus = "not_for_loan_status"
        case permanentLocation = "permanent_location"
        case publicNotes = "public_notes"
        case purchasePrice = "purchase_price"
        case renewalsCount = "renewals_count"
        case replacementPrice = "replacement_price"
        case replacementPriceDate = "replacement_price_date"
        case restrictedStatus = "restricted_status"
        case serialIssueNumber = "serial_issue_number"
        case timestamp, uri, withdrawn
        case withdrawnDate = "withdrawn_date"
    }
}
