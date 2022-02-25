//
//  ModelAddCheckout.swift
//  LibraryProject
//
//  Created by Yusef Naser on 23/02/2022.
//

import Foundation

//enum ModelAddCheckout : Codable {
//
//    case response(ModelResponse)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        if let x = try? container.decode(ModelResponse.self) {
//            self = .response(x)
//            return
//        }
//        throw DecodingError.typeMismatch(ModelAddCheckout.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FieldValue"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .response(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//
//    func getValue () -> Any {
//        switch self {
//        case .response(let f):
//            return f
//        case .string(let s) :
//            return s
//        }
//    }
//
//}


struct ModelAddCheckout: Codable {
    let errors: [ModelError]?
    let status: Int?
}

// MARK: - Error
struct ModelError: Codable {
    let message, path: String?
}
