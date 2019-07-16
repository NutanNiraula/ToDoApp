//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by Nutan Niraula on 7/15/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import XCTest
@testable import ToDoApp

class ToDoAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func stairCaseString(ofSize size: Int) -> String  {
        guard size > 0 else { return "Invalid" }
        var count = size
        return (1...size).reduce("") { (result, element) -> String in
            count -= 1
            return "\(result)\(String(repeating: " ", count: count))\((String(repeating: "*", count: element)))\n"
        }
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            print(stairCaseString(ofSize: 100))
        }
    }

}
