//
//  GymTests.swift
//  SlapCoreTests
//
//  Created by Oleksii on 26/10/2017.
//  Copyright © 2017 Toehook. All rights reserved.
//

import XCTest
import SlapCore

class GymTests: XCTestCase {
    
    func testGymEquatable() {
        let gym = Gym(name: "Neolit", colors: ["#000000", "#000000"])
        XCTAssertEqual(gym, Gym(name: "Neolit", colors: ["#000000", "#000000"]))
        XCTAssertNotEqual(gym, Gym(name: "Monk", colors: ["#000000", "#000000"]))
        XCTAssertNotEqual(gym, Gym(name: "Neolit", colors: ["#000000"]))
    }
    
}
