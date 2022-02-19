//
//  ModelChangePassword.swift
//  LibraryProject
//
//  Created by yusef naser on 17/02/2022.
//

enum ModelChangePassword : Codable {
    case changePassword(ChangePasswordClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(ChangePasswordClass.self) {
            self = .changePassword(x)
            return
        }
        throw DecodingError.typeMismatch(ChangePasswordClass.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CarElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .changePassword(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    func getValue () -> String? {
        switch self {
        case .changePassword(let obj) :
            return nil
        case .string(let s) :
            return s
        }
    }
}

struct ChangePasswordClass: Codable {
    let error: String?
    let requiredPermissions: String?

    enum CodingKeys: String, CodingKey {
        case error
        case requiredPermissions = "required_permissions"
    }
}
