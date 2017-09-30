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
    struct Builder: Codable {
        let firstName: String
        let lastName: String
    }
}

extension Route.Builder: Equatable {
    static func == (lhs: Route.Builder, rhs: Route.Builder) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

extension Route.Builder: JSONModelType {
    enum PropertyKey: String {
        case firstName, lastName
    }
    
    init(object: JSONObject<PropertyKey>) throws {
        firstName = try object.value(for: .firstName)
        lastName = try object.value(for: .lastName)
    }
    
    var dictValue: [PropertyKey : JSONRepresentable?] {
        return [.firstName: firstName, .lastName: lastName]
    }
}
