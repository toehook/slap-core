//
//  GradeTests.swift
//  Slap
//
//  Created by Oleksii on 08/02/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import XCTest
import SwiftyJSON
import SlapCore

class GradeTests: XCTestCase {
    typealias Grade = Route.Grade
    
    func testGradeComparable() {
        XCTAssertEqual(Grade(.six, .b), Grade(.six, .b))
        XCTAssertLessThan(Grade(.six, .a), Grade(.seven, .a))
        XCTAssertLessThan(Grade(.six, .a), Grade(.six, .c))
        XCTAssertLessThan(Grade(.six, .a), Grade(.six, .a, plus: true))
    }
    
    func testGradeStringInit() {
        XCTAssertEqual(Grade(.six, .b), Grade("6B"))
        XCTAssertEqual(Grade(.six, .a, plus: true), Grade("6A+"))
        XCTAssertNil(Grade("6B++++++"))
        XCTAssertNil(Grade("0a+"))
        XCTAssertNil(Grade("9z+"))
        XCTAssertNil(Grade("6Ba"))
        XCTAssertNil(Grade("6"))
    }
    
    func testCodable() {
        let decoder = JSONDecoder()
        let data = "[\"6B\"]".data(using: .utf8)!
        
        XCTAssertEqual([Grade(.six, .b)], try! decoder.decode(Array<Route.Grade>.self, from: data))
        XCTAssertThrowsError(try decoder.decode(Array<Route.Grade>.self, from: "[\"6B++++++\"]".data(using: .utf8)!))
        XCTAssertEqual(try? JSONEncoder().encode([Grade(.six, .b)]), data)
    }
    
    func testGradeJSONValue() {
        XCTAssertNil(try? Grade(json: "6"))
    }
    
    func testToStringConversion() {
        XCTAssertEqual(Grade(.six, .b).description, "6B")
        XCTAssertEqual(Grade(.seven, .a, plus: true).description, "7A+")
    }
    
}
