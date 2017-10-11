//
//  DateExtension.swift
//  SlapCore
//
//  Created by Oleksii on 11/10/2017.
//  Copyright © 2017 Toehook. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyJSONModel

extension Date: JSONInitializable {
    fileprivate static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    public init(json: JSON) throws {
        guard let date = Date.formatter.date(from: try json.value()) else {
            throw JSONModelError.invalidElement
        }
        self = date
    }
}

extension Date: JSONRepresentable {
    public var jsonValue: JSON {
        return Date.formatter.string(from: self).jsonValue
    }
}
