//
//  DateTests.swift
//  SlapCoreTests
//
//  Created by Oleksii on 11/10/2017.
//  Copyright © 2017 Toehook. All rights reserved.
//

import XCTest
import SwiftyJSON
import SwiftyJSONModel
import SlapCore

class DateTests: XCTestCase {
    
    func testDateJSONValue() {
        XCTAssertEqual((try? Date(json: "2017-10-11T15:37:19.000Z"))?.jsonValue, "2017-10-11T15:37:19.000Z")
        XCTAssertNil(try? Date(json: "some random string"))
    }
    
}
