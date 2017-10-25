//
//  RouteTests.swift
//  Slap
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import XCTest
import SlapCore

class RouteTests: XCTestCase {
    let id = UUID().uuidString
    
    func testRouteEquatable() {
        let grade = Route.Grade("7A+")!
        let createdAt = Date()
        let builder = Route.Builder(firstName: "John", lastName: "Doe")
        let route = Route(id: nil, number: 5, initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool", createdAt: createdAt)
        
        XCTAssertEqual(route.with(id: id), Route(id: id, number: 5, initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool", createdAt: createdAt))
        XCTAssertNotEqual(route, Route(id: id, number: 6, initialGrade: grade, builder: builder, color: .green, tagsString: "slap, cool"))
    }
    
    func testRouteTags() {
        let grade = Route.Grade("7A+")!
        let builder = Route.Builder(firstName: "John", lastName: "Doe")
        let routeOne = Route(id: id, number: 5, initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool")
        let routTwo = Route(id: id, number: 5, initialGrade: grade, builder: builder, color: .red, tagsString: "yo, wow,great")
        
        XCTAssertEqual(routeOne.tags, ["slap", "cool"])
        XCTAssertEqual(routTwo.tags, ["yo", "wow", "great"])
    }
}
