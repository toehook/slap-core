//
//  Route.swift
//  Slap
//
//  Created by Oleksii on 08/02/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import Foundation
import SwiftyJSONModel

public struct Route: Codable {
    public enum Color: String, Codable, JSONString {
        case red, green, blue, orange
        case yellow, purple
        case black, white
    }
    
    public let id: String?
    public let number: Int
    public let initialGrade: Grade
    public let builder: Builder
    public let color: Color
    public let tagsString: String
    public let createdAt: Date
    
    public init(id: String? = nil, number: Int, initialGrade: Grade, builder: Builder, color: Color, tagsString: String, createdAt: Date = Date()) {
        self.id = id
        self.number = number
        self.initialGrade = initialGrade
        self.builder = builder
        self.color = color
        self.tagsString = tagsString
        self.createdAt = createdAt
    }
    
    public func with(id: String) -> Route {
        return Route(
            id: id,
            number: number,
            initialGrade: initialGrade,
            builder: builder,
            color: color,
            tagsString: tagsString,
            createdAt: createdAt
        )
    }
    
    public var tags: [String] {
        return tagsString.replacingOccurrences(of: ", ", with: ",").components(separatedBy: ",")
    }
}

extension Route: Equatable {
    public static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
            && lhs.number == rhs.number
            && lhs.builder == rhs.builder
            && lhs.initialGrade == rhs.initialGrade
            && lhs.color == rhs.color
            && lhs.tagsString == rhs.tagsString
            && lhs.createdAt == rhs.createdAt
    }
}

extension Route: JSONModelType {
    public enum PropertyKey: String {
        case tags, builder, number
        case initialGrade, color
        case createdAt
    }
    
    public init(object: JSONObject<PropertyKey>) throws {
        id = nil
        number = try object.value(for: .number)
        tagsString = try object.value(for: .tags)
        builder = try object.value(for: .builder)
        initialGrade = try object.value(for: .initialGrade)
        color = try object.value(for: .color)
        createdAt = try object.value(for: .createdAt)
    }
    
    public var dictValue: [PropertyKey : JSONRepresentable?] {
        return [
            .number: number,
            .builder: builder,
            .initialGrade: initialGrade,
            .color: color, .tags: tagsString,
            .createdAt: createdAt
        ]
    }
}
