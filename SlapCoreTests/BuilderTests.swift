//
//  BuilderTests.swift
//  Slap
//
//  Created by Oleksii on 31/03/2017.
//  Copyright © 2017 Slap. All rights reserved.
//

import XCTest
import SlapCore

class BuilderTests: XCTestCase {
    
    func testBuilderEquatable() {
        XCTAssertEqual(Route.Builder(firstName: "Oleksii", lastName: "Dykan"), Route.Builder(firstName: "Oleksii", lastName: "Dykan"))
        XCTAssertNotEqual(Route.Builder(firstName: "Oleksii", lastName: "Dykan"), Route.Builder(firstName: "David", lastName: "van Leeuwen"))
    }
    
}
