//
//  MoviesParserTest.swift
//  MoviesTests
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import XCTest
@testable import Movies
class MoviesParserTest: XCTestCase {

  func testParesMovies() {
    let arr = [["name":"name1", "ratting": "12"], ["name":"name2", "ratting": "123"]]

    let dat = try! JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted)

    let parser = MoviesParser()
    let movies = parser.parseMovies(data: dat)

    XCTAssert(movies.count == 2)
    XCTAssert(movies[0].name == "name1")
    XCTAssert(movies[1].name == "name2")

    XCTAssert(movies[0].rating == "12")
    XCTAssert(movies[1].rating == "123")

  }

}
