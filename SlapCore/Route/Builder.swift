//
//  Builder.swift
//  Slap
//
//  Created by Oleksii on 08/02/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import Foundation
import SwiftyJSONModel

extension Route {
    public struct Builder: Codable {
        let firstName: String
        let lastName: String
        
        public init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
}

extension Route.Builder: Equatable {
    public static func == (lhs: Route.Builder, rhs: Route.Builder) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

extension Route.Builder: JSONModelType {
    public enum PropertyKey: String {
        case firstName, lastName
    }
    
    public init(object: JSONObject<PropertyKey>) throws {
        firstName = try object.value(for: .firstName)
        lastName = try object.value(for: .lastName)
    }
    
    public var dictValue: [PropertyKey : JSONRepresentable?] {
        return [.firstName: firstName, .lastName: lastName]
    }
}
