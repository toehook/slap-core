//
//  RouteTests.swift
//  Slap
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import XCTest
import SwiftyJSON
import SwiftyJSONModel
import SlapCore

class RouteTests: XCTestCase {
    let id = UUID().uuidString
    
    func testRouteEquatable() {
        let grade = Route.Grade("7A+")!
        let createdAt = try! Date(json: "2017-10-11T15:37:19.000Z")
        let builder = Route.Builder(firstName: "John", lastName: "Doe")
        let route = Route(id: id, title: "slap", location: "corner", initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool", createdAt: createdAt)
        let routeJSON: JSON = [
            "id": id,
            "title": "slap",
            "location": "corner",
            "initialGrade": "7A+",
            "builder": [
                "firstName": "John",
                "lastName": "Doe"
            ],
            "color": "red",
            "tags": "slap, cool",
            "createdAt": "2017-10-11T15:37:19.000Z"
        ]
        
        XCTAssertEqual(route, Route(id: id, title: "slap", location: "corner", initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool", createdAt: createdAt))
        XCTAssertEqual(try? Route(json: routeJSON), route)
        XCTAssertEqual(route.jsonValue, routeJSON)
        XCTAssertNotEqual(route, Route(id: id, title: "slap", location: "corner", initialGrade: grade, builder: builder, color: .green, tagsString: "slap, cool"))
    }
    
    func testRouteTags() {
        let grade = Route.Grade("7A+")!
        let builder = Route.Builder(firstName: "John", lastName: "Doe")
        let routeOne = Route(id: id, title: "slap", location: "corner", initialGrade: grade, builder: builder, color: .red, tagsString: "slap, cool")
        let routTwo = Route(id: id, title: "slap", location: "corner", initialGrade: grade, builder: builder, color: .red, tagsString: "yo, wow,great")
        
        XCTAssertEqual(routeOne.tags, ["slap", "cool"])
        XCTAssertEqual(routTwo.tags, ["yo", "wow", "great"])
    }
}
