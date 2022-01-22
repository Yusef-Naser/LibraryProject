//
//  ModelBook.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//


// object like this :
// https://library.awresidence.com/cgi-bin/koha/opac-MARCdetail.pl?biblionumber=2033

enum EnumStringType {
    case title
    case classificationNumber
    case personalName
    case publicationDetails
    case subjects
    case description
}

struct ModelBook: Codable {
    let leader: String?
    let fields: [[String: ModelFieldValue]]?
    
    private func getClassificationNumberObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["082"] != nil {
                return item["082"]?.getValue() as? FieldClass
            }
        }
        return nil
    }
    
    private func getTitleObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["245"] != nil {
                return item["245"]?.getValue() as? FieldClass
            }
        }
        return nil
    }
    
    private func getPersonalNameObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["100"] != nil {
                return item["100"]?.getValue() as? FieldClass
            }
        }
        return nil
    }
    
    private func getPublicationDetailsObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["260"] != nil {
                return item["260"]?.getValue() as? FieldClass
            }
        }
        return nil
    }
    
    private func getDescriptionObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["300"] != nil {
                return item["300"]?.getValue() as? FieldClass
            }
        }
        return nil
    }
    
    
    private func getSubjectObject () -> FieldClass? {
        
        var f : FieldClass? = nil
        
        for item in fields ?? [] {
            if item["653"] != nil {
                if f == nil {
                    f = item["653"]?.getValue() as? FieldClass
                }else if let fff = item["653"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    func getTitle (type : EnumStringType) -> String? {
        var item : FieldClass? = nil
        switch type {
        case .classificationNumber:
            item = getClassificationNumberObject()
        case .personalName :
            item = getPersonalNameObject()
        case .title :
            item = getTitleObject()
        case .publicationDetails :
            item = getPublicationDetailsObject()
        case .subjects :
            item = getSubjectObject()
        case .description :
            item = getDescriptionObject()
        default:
            break
        }
        guard let item = item else {
            return nil
        }
        var a = ""
        var b = ""
        var c = ""
        var d = ""
        var the = ""
        
        for i in item.subfields ?? [] {
            if let aa = i.a {
                a = a + " " + aa
            }else if let bb = i.b {
                b = b + " " + bb
            }else if let cc = i.c {
                c = c + " " + cc
            }else if let dd = i.d {
                d = d + " " + dd
            }else if let t = i.the2 {
                the = the + " " + t
            }
        }
        return a + b + c + d + the
    }
    
    
    
}


enum ModelFieldValue : Codable {
    case fieldClass(FieldClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(FieldClass.self) {
            self = .fieldClass(x)
            return
        }
        throw DecodingError.typeMismatch(ModelFieldValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FieldValue"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .fieldClass(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    
    func getValue () -> Any {
        switch self {
        case .fieldClass(let f):
            return f
        case .string(let s) :
            return s
        }
    }
}

// MARK: - FieldClass
struct FieldClass: Codable {
    var subfields: [Subfield]?
    let ind1, ind2: String?
}

// MARK: - Subfield
struct Subfield: Codable {
    let a, b, c, the2: String?
    let d: String?

    enum CodingKeys: String, CodingKey {
        case a, b, c
        case the2 = "2"
        case d
    }
}
