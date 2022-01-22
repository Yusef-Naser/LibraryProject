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

    enum CodingKeys: String, CodingKey {
        case apiURL = "api_url"
        case searchURL = "search_url"
        case logo
        case homePage = "home_page"
    }
}


struct ModelHomePage : Codable {
    let wellcomeText: String?
    let silder, latest, suggested: [ModelLatest]?

    enum CodingKeys: String, CodingKey {
        case wellcomeText = "wellcome_text"
        case silder, latest, suggested
    }
}


struct ModelLatest: Codable {
    let biblionumber: Int?
    let title: String?
    let image: String?
}
