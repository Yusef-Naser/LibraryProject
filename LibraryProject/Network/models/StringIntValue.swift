//
//  StringIntValue.swift
//  LibraryProject
//
//  Created by Yusef Naser on 09/02/2022.
//

enum StringIntValue : Codable {
    case int(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .int(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(StringIntValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    
    func getValue () -> Int? {
        switch self {
        case .int(let int):
            return int
        case .string(let str) :
            return Int(str)
        }
    }
    
}
