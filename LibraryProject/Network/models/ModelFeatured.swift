//
//  ModelHome.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

//struct ModelHome : Codable {
//    let menu: ModelMenu?
//}
//
//struct ModelMenu : Codable {
//    let apiURL: String?
//    let searchURL: String?
//    let logo: String?
//    let homePage: ModelHomePage?
//    let categories: [[String : String]]?
//    
//    enum CodingKeys: String, CodingKey {
//        case apiURL = "api_url"
//        case searchURL = "search_url"
//        case logo
//        case homePage = "home_page"
//        case categories
//    }
//}
//
//
//struct ModelHomePage : Codable {
//    let wellcomeText: String?
//    let silder : [ModelSlider]?
//    let latest, suggested: [ModelLatest]?
//
//    enum CodingKeys: String, CodingKey {
//        case wellcomeText = "wellcome_text"
//        case silder, latest, suggested
//    }
//}
//
//struct ModelSlider: Codable {
//    let blink: String?
//    let title: String?
//    let image: String?
//}
//
struct ModelLatest: Codable {
    let biblionumber: Int?
    let title: String?
    var image: String?
}

typealias ModelArrayLatest = [ModelLatest]

// MARK: - ModelFeatured
struct ModelFeatured: Codable {
    let status: Int?
    let message: String?
    let data: ModelDataFeaturedBooks?
}

// MARK: - DataClass
struct ModelDataFeaturedBooks: Codable {
    let id: Int?
    let slug, name: String?
    let books: [ModelFeaturedBook]?
}

// MARK: - Book
struct ModelFeaturedBook: Codable {
    let id: Int?
    let title, author: String?
    let imageURL: String?
    let categoryName: String?
    let biblionumber: Int?

    var imageFullURL : String? {
        guard let path = imageURL else { return nil }
        return "\(COVER_IMAGE_URL(path))"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, author
        case imageURL = "image_url"
        case categoryName = "category_name"
        case biblionumber
    }
}
