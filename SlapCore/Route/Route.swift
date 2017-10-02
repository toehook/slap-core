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
    
    public let id: String
    public let title: String
    public let location: String
    public let initialGrade: Grade
    public let builder: Builder
    public let color: Color
    public let tagsString: String
    
    public init(id: String, title: String, location: String, initialGrade: Grade, builder: Builder, color: Color, tagsString: String) {
        self.id = id
        self.title = title
        self.location = location
        self.initialGrade = initialGrade
        self.builder = builder
        self.color = color
        self.tagsString = tagsString
    }
    
    public var tags: [String] {
        return tagsString.replacingOccurrences(of: ", ", with: ",").components(separatedBy: ",")
    }
}

extension Route: Equatable {
    public static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.location == rhs.location
            && lhs.location == rhs.location
            && lhs.builder == rhs.builder
            && lhs.initialGrade == rhs.initialGrade
            && lhs.color == rhs.color
            && lhs.tagsString == rhs.tagsString
    }
}

extension Route: JSONModelType {
    public enum PropertyKey: String {
        case id
        case title, location, tags, builder
        case initialGrade, color
    }
    
    public init(object: JSONObject<PropertyKey>) throws {
        id = try object.value(for: .id)
        title = try object.value(for: .title)
        location = try object.value(for: .location)
        tagsString = try object.value(for: .tags)
        builder = try object.value(for: .builder)
        initialGrade = try object.value(for: .initialGrade)
        color = try object.value(for: .color)
    }
    
    public var dictValue: [PropertyKey : JSONRepresentable?] {
        return [
            .id: id, .title: title, .location: location,
            .builder: builder, .initialGrade: initialGrade,
            .color: color, .tags: tagsString
        ]
    }
}
