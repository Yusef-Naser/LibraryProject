//
//  ModelItemsBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 24/01/2022.
//

struct ModelItemsBook: Codable {
//    let acquisitionDate: String?
//    let biblioID: Int?
    
    //let checkedOutDate, copyNumber: String?
//    let damagedStatus: Int?
//    let externalID , homeLibraryID: String?
//    let itemID: Int?
    let callnumber: String?
    let holdingLibraryID : String?
    let itemTypeID: String?
    let externalID: String?
 //   let location: String?
 //   let lostStatus, notForLoanStatus: Int?
//    let publicNotes, restrictedStatus, serialIssueNumber, uri: JSONNull?
//    let withdrawn: Int?

    enum CodingKeys: String, CodingKey {
//        case acquisitionDate = "acquisition_date"
//        case biblioID = "biblio_id"
        case callnumber
      //  case checkedOutDate = "checked_out_date"
      //  case copyNumber = "copy_number"
//        case damagedStatus = "damaged_status"
//        case externalID = "external_id"
        case holdingLibraryID = "holding_library_id"
//        case homeLibraryID = "home_library_id"
//        case itemID = "item_id"
        case itemTypeID = "item_type_id"
        case externalID = "external_id"
     //   case location
//        case lostStatus = "lost_status"
//        case notForLoanStatus = "not_for_loan_status"
//        case publicNotes = "public_notes"
//        case restrictedStatus = "restricted_status"
//        case serialIssueNumber = "serial_issue_number"
//        case uri
//        case withdrawn
    }
}

typealias ModelItemsBookArray = [ModelItemsBook]
