//
//  ModelHome.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

struct ModelHome : Codable {
    let menu: ModelMenu?
}

struct ModelMenu : Codable {
    let apiURL: String?
    let searchURL: String?
    let logo: String?
    let homePage: ModelHomePage?
    let categories: [[String : String]]?
    
    enum CodingKeys: String, CodingKey {
        case apiURL = "api_url"
        case searchURL = "search_url"
        case logo
        case homePage = "home_page"
        case categories
    }
}


struct ModelHomePage : Codable {
    let wellcomeText: String?
    let silder : [ModelSlider]?
    let latest, suggested: [ModelLatest]?

    enum CodingKeys: String, CodingKey {
        case wellcomeText = "wellcome_text"
        case silder, latest, suggested
    }
}

struct ModelSlider: Codable {
    let blink: String?
    let title: String?
    let image: String?
}

struct ModelLatest: Codable {
    let biblionumber: Int?
    let title: String?
    let image: String?
}

typealias ModelArrayLatest = [ModelLatest]


//struct ModelCategory : Codable {
//    
//    let rost, lib, kil, cof: String?
//    let rcb: String?
//
//    enum CodingKeys: String, CodingKey {
//        case rost = "ROST"
//        case lib = "LIB"
//        case kil = "KIL"
//        case cof = "COF"
//        case rcb = "RCB"
//    }
//}
