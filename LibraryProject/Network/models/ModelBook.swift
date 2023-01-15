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
    case abstract
    case classificationNumber
    case personalName
    case publicationDetails
    case subjects
    case description
    case author
    case address
    case callNumber
    case itemType
    case subfields([SubFields])
    
    enum SubFields {
        case a
        case b
        case c
        case d
        case the
        case all
    }
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
    
    private func getAbstractObject () -> FieldClass? {
        for item in fields ?? [] {
            if item["520"] != nil {
                return item["520"]?.getValue() as? FieldClass
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
            if item["650"] != nil {
                if f == nil {
                    f = item["650"]?.getValue() as? FieldClass
                }else if let fff = item["650"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    private func getAuthorObject () -> FieldClass? {
        
        var f : FieldClass? = nil
        
        for item in fields ?? [] {
            if item["100"] != nil {
                if f == nil {
                    f = item["100"]?.getValue() as? FieldClass
                }else if let fff = item["100"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    private func getAddressObject () -> FieldClass? {
        
        var f : FieldClass? = nil
        
        for item in fields ?? [] {
            if item["245"] != nil {
                if f == nil {
                    f = item["245"]?.getValue() as? FieldClass
                }else if let fff = item["245"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    private func getItemTypeObject () -> FieldClass? {
        
        var f : FieldClass? = nil
        
        for item in fields ?? [] {
            if item["942"] != nil {
                if f == nil {
                    f = item["942"]?.getValue() as? FieldClass
                }else if let fff = item["942"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    private func getCallNumberObject () -> FieldClass? {
        
        var f : FieldClass? = nil
        
        for item in fields ?? [] {
            if item["082"] != nil {
                if f == nil {
                    f = item["082"]?.getValue() as? FieldClass
                }else if let fff = item["082"]?.getValue() as? FieldClass {
                    for i in fff.subfields ?? [] {
                        f?.subfields?.append(i)
                    }
                }
            }
        }
        return f
    }
    
    
    func getTitle (type : EnumStringType, subfields : [EnumStringType.SubFields] = [.all]) -> String? {
        var item : FieldClass? = nil
        switch type {
        case .classificationNumber:
            item = getClassificationNumberObject()
        case .personalName :
            item = getPersonalNameObject()
        case .title :
            item = getTitleObject()
        case .abstract :
            item = getAbstractObject()
        case .publicationDetails :
            item = getPublicationDetailsObject()
        case .subjects :
            item = getSubjectObject()
        case .description :
            item = getDescriptionObject()
        case .author :
            item = getAuthorObject()
        case .address :
            item = getAddressObject()
        case .itemType :
            item = getItemTypeObject()
        case .callNumber :
            item = getCallNumberObject()
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
            if let aa = i.a , (subfields.contains(.a) || subfields.contains(.all) ) {
                a = a + " " + aa
            }else if let bb = i.b , (subfields.contains(.b) || subfields.contains(.all) ) {
                b = b + " " + bb
            }else if let cc = i.c , (subfields.contains(.c) || subfields.contains(.all) ) {
                c = c + " " + cc
            }else if let dd = i.d , (subfields.contains(.d) || subfields.contains(.all) ) {
                d = d + " " + dd
            }else if let t = i.the2 , (subfields.contains(.the) || subfields.contains(.all) ) {
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
