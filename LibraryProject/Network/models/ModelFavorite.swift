//
//  ModelFavorite.swift
//  LibraryProject
//
//  Created by Yusef Naser on 25/02/2022.
//

import Foundation

struct ModelFavorite : Codable {
    let id : Int?
    let title : String?
    let image : String?
    
//    func getIcon () -> String? {
//        let icon = "https://library.awresidence.com/cgi-bin/koha/opac-image.pl?biblionumber="
//        return icon + "\(id ?? 0)"
//    }
    
    static func getModelFavorite (book : ModelLatest) -> ModelFavorite {
        return ModelFavorite(id: book.biblionumber, title: book.title , image: book.image)
    }
    
    static func getModelFavorite (book : ModelSuggestedBook) -> ModelFavorite {
        return ModelFavorite(id: Int(book.biblionumber ?? "0"), title: book.title , image: book.imageURL)
    }
}
