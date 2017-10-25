//
//  Builder.swift
//  Slap
//
//  Created by Oleksii on 08/02/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import Foundation

extension Route {
    public struct Builder: Codable {
        public let firstName: String
        public let lastName: String
        
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
