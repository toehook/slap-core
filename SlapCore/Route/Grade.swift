//
//  Grade.swift
//  Slap
//
//  Created by Oleksii on 08/02/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyJSONModel

extension Route {
    struct Grade {
        enum ParsingError: Error {
            case invalidGrade
        }
        
        enum Letter: Character {
            case a = "A", b = "B", c = "C"
        }
        
        enum Number: Int {
            case one = 1, two, thee, four
            case five, six, seven, eight, nine
        }
        
        let number: Number
        let letter: Letter
        let isPlus: Bool
        
        init(_ number: Number, _ letter: Letter, plus: Bool = false) {
            self.number = number
            self.letter = letter
            isPlus = plus
        }
    }
}

extension Route.Grade: CustomStringConvertible {
    init?(_ string: String) {
        let count = string.characters.count
        let start = string.startIndex
        let letterIndex = string.index(after: start)
        
        guard count == 2 || (count == 3 && string[string.index(after: letterIndex)] == "+") else { return nil }
        guard let int = Int(String(string[start])), let number = Number(rawValue: int) else { return nil }
        guard let letter = Letter(rawValue: string[letterIndex]) else { return nil }
        
        self.number = number
        self.letter = letter
        isPlus = count == 3
    }
    
    var stringValue: String {
        let string = "\(number.rawValue)\(letter.rawValue)"
        return isPlus ? string + "+" : string
    }
    
    var description: String {
        return stringValue
    }
}

extension Route.Grade: Comparable {
    static func == (lhs: Route.Grade, rhs: Route.Grade) -> Bool {
        return lhs.number == rhs.number && lhs.letter == rhs.letter && lhs.isPlus == rhs.isPlus
    }
    
    static func < (lhs: Route.Grade, rhs: Route.Grade) -> Bool {
        if lhs.number != rhs.number {
            return lhs.number.rawValue < rhs.number.rawValue
        } else if lhs.letter != rhs.letter {
            return lhs.letter.rawValue < rhs.letter.rawValue
        }
        return lhs.isPlus == false && rhs.isPlus == true
    }
}

extension Route.Grade: Codable {
    init(from decoder: Decoder) throws {
        let string = try decoder.singleValueContainer().decode(String.self)
        guard let grade = Route.Grade(string) else { throw ParsingError.invalidGrade }
        self = grade
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }
}

extension Route.Grade: JSONInitializable, JSONRepresentable {
    init(json: JSON) throws {
        guard let grade = Route.Grade(try json.value()) else {
            throw JSONModelError.invalidElement
        }
        self = grade
    }
    
    var jsonValue: JSON {
        return JSON(string: stringValue)
    }
}
