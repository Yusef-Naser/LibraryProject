//
//  ModelPrivacyPolicy.swift
//  LibraryProject
//
//  Created by yusef naser on 29/11/2025.
//

struct ModelPrivacyPolicy: Codable {
    let status: Int?
    let message: String?
    let data: ModelPrivacyPolicyItem?
}

// MARK: - DataClass
struct ModelPrivacyPolicyItem: Codable {
    let slug, title, description, titleEn: String?
    let descriptionEn: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case slug, title, description
        case titleEn = "title_en"
        case descriptionEn = "description_en"
        case image
    }
}
