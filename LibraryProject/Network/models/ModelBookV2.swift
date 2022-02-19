//
//  ModelBookV2.swift
//  LibraryProject
//
//  Created by Yusef Naser on 19/02/2022.
//

struct ModelBookV2 : Codable {
    let abstract: String?
    let ageRestriction: String?
    let author: String?
    let biblioID: Int?
    let cnClass, cnItem: String?
    let cnSort, cnSource: String?
    let cnSuffix, collectionIssn, collectionTitle, collectionVolume: String?
    let copyrightDate: Int?
    let creationDate: String?
    let ean, editionStatement: String?
    let frameworkID, illustrations, isbn: String?
    let issn: String?
    let itemType: String?
    let lcControlNumber: Int?
    let materialSize: String?
    let medium, notes: String?
    let number : Int?
    let pages: String?
    let partName : String?
    let partNumber : Int?
    let publicationPlace: String?
    let publicationYear: Int?
    let publisher: String?
    let serial: Bool?
    let serialTotalIssues, seriesTitle: Int?
    let subtitle: String?
    let timestamp: String?
    let title: String?
    let uniformTitle, url, volume, volumeDate: String?
    let volumeDescription: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case ageRestriction = "age_restriction"
        case author
        case biblioID = "biblio_id"
        case cnClass = "cn_class"
        case cnItem = "cn_item"
        case cnSort = "cn_sort"
        case cnSource = "cn_source"
        case cnSuffix = "cn_suffix"
        case collectionIssn = "collection_issn"
        case collectionTitle = "collection_title"
        case collectionVolume = "collection_volume"
        case copyrightDate = "copyright_date"
        case creationDate = "creation_date"
        case ean
        case editionStatement = "edition_statement"
        case frameworkID = "framework_id"
        case illustrations, isbn, issn
        case itemType = "item_type"
        case lcControlNumber = "lc_control_number"
        case materialSize = "material_size"
        case medium, notes, number, pages
        case partName = "part_name"
        case partNumber = "part_number"
        case publicationPlace = "publication_place"
        case publicationYear = "publication_year"
        case publisher, serial
        case serialTotalIssues = "serial_total_issues"
        case seriesTitle = "series_title"
        case subtitle, timestamp, title
        case uniformTitle = "uniform_title"
        case url, volume
        case volumeDate = "volume_date"
        case volumeDescription = "volume_description"
    }
}
