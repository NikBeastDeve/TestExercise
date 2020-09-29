//
//  ListDataType.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation

// MARK: - Welcome
struct ListDataType: Codable {
    let data: [Datum]
    let view: [String]
}

// MARK: - Datum
struct Datum: Codable {
    let name: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let text: String
}

// для удобства
enum DataType: String {
    case text = "hz"
    case picture = "picture"
    case selector = "selector"
}
