//
//  Gym.swift
//  SlapCore
//
//  Created by Oleksii on 26/10/2017.
//  Copyright © 2017 Toehook. All rights reserved.
//

import Foundation

public struct Gym: Equatable, Codable {
    public let name: String
    public let colors: [String]
    
    public init(name: String, colors: [String]) {
        self.name = name
        self.colors = colors
    }
    
    public static func == (lhs: Gym, rhs: Gym) -> Bool {
        return lhs.name == rhs.name && lhs.colors == rhs.colors
    }
}
