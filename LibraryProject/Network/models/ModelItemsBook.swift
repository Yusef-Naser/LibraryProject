//
//  ModelItemsBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 24/01/2022.
//

struct ModelItemsBook: Codable {
    let message, path: String?
}

typealias ModelItemsBookArray = [ModelItemsBook]
