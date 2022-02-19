//
//  ModelUser.swift
//  LibraryProject
//
//  Created by yusef naser on 17/02/2022.
//

struct ModelUser: Codable {
    let address, address2, altaddressAddress, altaddressAddress2: String?
    let altaddressCity, altaddressCountry, altaddressEmail, altaddressNotes: String?
    let altaddressPhone, altaddressPostalCode, altaddressState, altaddressStreetNumber: String?
    let altaddressStreetType: String?
    let altcontactAddress, altcontactAddress2, altcontactCity, altcontactCountry: String?
    let altcontactFirstname, altcontactPhone, altcontactPostalCode, altcontactState: String?
    let altcontactSurname: String?
    let anonymized, autorenewCheckouts: Bool?
    let cardnumber, categoryID, checkPreviousCheckout, city: String?
    let country, dateEnrolled: String?
    let dateOfBirth, dateRenewed: String?
    let email, expiryDate, fax, firstname: String?
    let gender: String?
    let incorrectAddress: Bool?
    let initials, lang: String?
    let lastSeen: String?
    let libraryID: String?
    let loginAttempts: Int?
    let mobile, opacNotes, otherName: String?
    let overdriveAuthToken: String?
    let patronCardLost: Bool?
    let patronID: Int?
    let phone, postalCode: String?
    let privacy, privacyGuarantorCheckouts: Int?
    let privacyGuarantorFines: Bool?
    let relationshipType: String?
    let restricted: Bool?
    let secondaryEmail, secondaryPhone: String?
    let smsNumber, smsProviderID: String?
    let staffNotes, state, statistics1, statistics2: String?
    let streetNumber: String?
    let streetType: String?
    let surname, title: String?
    let updatedOn: String?
    let userid: String?

    enum CodingKeys: String, CodingKey {
        case address, address2
        case altaddressAddress = "altaddress_address"
        case altaddressAddress2 = "altaddress_address2"
        case altaddressCity = "altaddress_city"
        case altaddressCountry = "altaddress_country"
        case altaddressEmail = "altaddress_email"
        case altaddressNotes = "altaddress_notes"
        case altaddressPhone = "altaddress_phone"
        case altaddressPostalCode = "altaddress_postal_code"
        case altaddressState = "altaddress_state"
        case altaddressStreetNumber = "altaddress_street_number"
        case altaddressStreetType = "altaddress_street_type"
        case altcontactAddress = "altcontact_address"
        case altcontactAddress2 = "altcontact_address2"
        case altcontactCity = "altcontact_city"
        case altcontactCountry = "altcontact_country"
        case altcontactFirstname = "altcontact_firstname"
        case altcontactPhone = "altcontact_phone"
        case altcontactPostalCode = "altcontact_postal_code"
        case altcontactState = "altcontact_state"
        case altcontactSurname = "altcontact_surname"
        case anonymized
        case autorenewCheckouts = "autorenew_checkouts"
        case cardnumber
        case categoryID = "category_id"
        case checkPreviousCheckout = "check_previous_checkout"
        case city, country
        case dateEnrolled = "date_enrolled"
        case dateOfBirth = "date_of_birth"
        case dateRenewed = "date_renewed"
        case email
        case expiryDate = "expiry_date"
        case fax, firstname, gender
        case incorrectAddress = "incorrect_address"
        case initials, lang
        case lastSeen = "last_seen"
        case libraryID = "library_id"
        case loginAttempts = "login_attempts"
        case mobile
        case opacNotes = "opac_notes"
        case otherName = "other_name"
        case overdriveAuthToken = "overdrive_auth_token"
        case patronCardLost = "patron_card_lost"
        case patronID = "patron_id"
        case phone
        case postalCode = "postal_code"
        case privacy
        case privacyGuarantorCheckouts = "privacy_guarantor_checkouts"
        case privacyGuarantorFines = "privacy_guarantor_fines"
        case relationshipType = "relationship_type"
        case restricted
        case secondaryEmail = "secondary_email"
        case secondaryPhone = "secondary_phone"
        case smsNumber = "sms_number"
        case smsProviderID = "sms_provider_id"
        case staffNotes = "staff_notes"
        case state
        case statistics1 = "statistics_1"
        case statistics2 = "statistics_2"
        case streetNumber = "street_number"
        case streetType = "street_type"
        case surname, title
        case updatedOn = "updated_on"
        case userid
    }
}
