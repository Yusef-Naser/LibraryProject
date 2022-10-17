//
//  ModelSearch.swift
//  LibraryProject
//
//  Created by Yusef Naser on 23/01/2022.
//

struct ModelSearch: Codable {
    let zsSearchRetrieveResponse: ZsSearchRetrieveResponse?
    let encoding, version: String?

    enum CodingKeys: String, CodingKey {
        case zsSearchRetrieveResponse = "zs$searchRetrieveResponse"
        case encoding = "@encoding"
        case version = "@version"
    }
    
    func getTitleArray () -> [(String , String)] {
        let s = zsSearchRetrieveResponse?.zsRecords?.zsRecord?.getValue()
        var arrayStrings : [(String , String)] = []
        for item in s ?? [] {
            let str = getSingleTitle(record: item)
            let id = getBookNumber(record: item)
            arrayStrings.append( (str , id) )
        }
        
        return arrayStrings
        
    }
    
    private func getSingleTitle (record : ZsRecord?) -> String {
        let data = record?.zsRecordData?.record?.datafield?.filter({$0.tag == "245"}).first
        
        var a = ""
        var b = ""
        var c = ""
        var d = ""
        var the = ""
        
        for i in data?.subfield?.getArray() ?? [] {
            if i.code == "a" , let t = i.t {
                a = a + " " + t
            }else if i.code == "b" , let t = i.t {
                b = b + " " + t
            }else if i.code == "c" , let t = i.t {
                c = c + " " + t
            }else if i.code == "d" , let t = i.t {
                d = d + " " + t
            }else if i.code == "2" , let t = i.t {
                the = the + " " + t
            }
        }
        return a + b + c + d + the
    }
    
    private func getBookNumber (record : ZsRecord?) -> String {
        let data = record?.zsRecordData?.record?.datafield?.filter({$0.tag == "999"}).first

        let c = data?.subfield?.getArray().filter({$0.code == "c"}).first

        return c?.t ?? ""
        
    }
    
}

// MARK: - ZsSearchRetrieveResponse
struct ZsSearchRetrieveResponse: Codable {
    let zsNumberOfRecords: ZsNumberOfRecords?
    let xmlnsZs: String?
    let zsEchoedSearchRetrieveRequest: ZsEchoedSearchRetrieveRequest?
    let zsRecords: ZsRecords?
    let zsVersion: ZsNumberOfRecords?

    enum CodingKeys: String, CodingKey {
        case zsNumberOfRecords = "zs$numberOfRecords"
        case xmlnsZs = "@xmlns:zs"
        case zsEchoedSearchRetrieveRequest = "zs$echoedSearchRetrieveRequest"
        case zsRecords = "zs$records"
        case zsVersion = "zs$version"
    }
}

// MARK: - ZsEchoedSearchRetrieveRequest
struct ZsEchoedSearchRetrieveRequest: Codable {
    let zsStartRecord, zsRecordPacking, zsQuery, zsRecordSchema: ZsNumberOfRecords?
    let zsMaximumRecords, zsVersion: ZsNumberOfRecords?

    enum CodingKeys: String, CodingKey {
        case zsStartRecord = "zs$startRecord"
        case zsRecordPacking = "zs$recordPacking"
        case zsQuery = "zs$query"
        case zsRecordSchema = "zs$recordSchema"
        case zsMaximumRecords = "zs$maximumRecords"
        case zsVersion = "zs$version"
    }
}

// MARK: - ZsNumberOfRecords
struct ZsNumberOfRecords: Codable {
    let t: String?

    enum CodingKeys: String, CodingKey {
        case t = "$t"
    }
}

// MARK: - ZsRecords
struct ZsRecords: Codable {
    let zsRecord: CustomZsRecords?

    enum CodingKeys: String, CodingKey {
        case zsRecord = "zs$record"
    }
}

enum CustomZsRecords : Codable {
    case arrayRecords([ZsRecord]?)
    case record(ZsRecord?)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([ZsRecord].self) {
            self = .arrayRecords(x)
            return
        }
        if let x = try? container.decode(ZsRecord.self) {
            self = .record(x)
            return
        }
        throw DecodingError.typeMismatch(CustomZsRecords.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IDElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .arrayRecords(let x):
            try container.encode(x)
        case .record(let x):
            try container.encode(x)
        }
    }
    func getValue () -> [ZsRecord]? {
        switch self {
        case .arrayRecords(let val) :
            return val
        case .record(let value) :
            if let v = value {
                return [v]
            }
            return []
        }
    }
}

// MARK: - ZsRecord
struct ZsRecord: Codable {
    let zsRecordPosition, zsRecordSchema: ZsNumberOfRecords?
    let zsRecordData: ZsRecordData?
    let zsRecordPacking: ZsNumberOfRecords?

    enum CodingKeys: String, CodingKey {
        case zsRecordPosition = "zs$recordPosition"
        case zsRecordSchema = "zs$recordSchema"
        case zsRecordData = "zs$recordData"
        case zsRecordPacking = "zs$recordPacking"
    }
}

// MARK: - ZsRecordData
struct ZsRecordData: Codable {
    let record: Record?
}

// MARK: - Record
struct Record: Codable {
  //  let controlfield: Controlfield?
    let xsiSchemaLocation: String?
    let xmlns, xmlnsXsi: String?
    let leader: ZsNumberOfRecords?
    let datafield: [Datafield]?

    enum CodingKeys: String, CodingKey {
    //    case controlfield
        case xsiSchemaLocation = "@xsi:schemaLocation"
        case xmlns = "@xmlns"
        case xmlnsXsi = "@xmlns:xsi"
        case leader, datafield
    }
}

// MARK: - Controlfield
struct Controlfield: Codable {
    let t, tag: String?

    enum CodingKeys: String, CodingKey {
        case t = "$t"
        case tag = "@tag"
    }
}

// MARK: - Datafield
struct Datafield: Codable {
    let ind2, tag, ind1: String?
    let subfield: SubfieldUnion?

    enum CodingKeys: String, CodingKey {
        case ind2 = "@ind2"
        case tag = "@tag"
        case ind1 = "@ind1"
        case subfield
    }
}

enum SubfieldUnion: Codable {
    case subfieldElement(SubfieldElement)
    case subfieldElementArray([SubfieldElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([SubfieldElement].self) {
            self = .subfieldElementArray(x)
            return
        }
        if let x = try? container.decode(SubfieldElement.self) {
            self = .subfieldElement(x)
            return
        }
        throw DecodingError.typeMismatch(SubfieldUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SubfieldUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .subfieldElement(let x):
            try container.encode(x)
        case .subfieldElementArray(let x):
            try container.encode(x)
        }
    }
    
    func getArray () -> [SubfieldElement] {
        switch self {
        case .subfieldElement(let element):
            return [element]
        case .subfieldElementArray(let arr) :
            return arr
        }
    }
}

// MARK: - SubfieldElement
struct SubfieldElement: Codable {
    let code, t: String?

    enum CodingKeys: String, CodingKey {
        case code = "@code"
        case t = "$t"
    }
}
