//
//  MoviesUITests.swift
//  MoviesUITests
//
//  Created by zip520123 on 2019/9/12.
//  Copyright © 2019 zip520123. All rights reserved.
//

import XCTest
//[
//  {
//    "name": "Avengers: Infinity War",
//    "rating": "8.5",
//    "desc": "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.",
//
//  },
//  {
//    "name": "Bohemian Rhapsody",
//    "rating": "8.4",
//    "desc": "A chronicle of the years leading up to Queen's legendary appearance at the Live Aid (1985) concert.",
//
//  },
//  {
//    "name": "Aquaman",
//    "rating": "8.3",
//    "desc": "Arthur Curry learns that he is the heir to the underwater kingdom of Atlantis, and must step forward to lead his people and be a hero to the world.",
//
//  },
//  {
//    "name": "A Star Is Born",
//    "rating": "8.2",
//    "desc": "A musician helps a young singer find fame, even as age and alcoholism send his own career into a downward spiral.",
//
//  },
//]
class MoviesUITests: XCTestCase {

  let app = XCUIApplication()
  let dynamiceStubs = HTTPDynamicStubs()

    override func setUp() {

      continueAfterFailure = false
      dynamiceStubs.setUp()
      app.launchEnvironment = ["BASEURL" : "http://localhost:8080", "isUITest":"true"]
      continueAfterFailure = false
      super.setUp()
    }

    override func tearDown() {
      super.tearDown()
      dynamiceStubs.tearDown()
      
  }


  func testShowingMovieNameAndImageName() {
    dynamiceStubs.setupStub(url: "/Movies", filename: "listOfMovies", method: .GET)
    app.launch()

    let tablesQuery = app.tables

    // Assert on first movie
    XCTAssertTrue(tablesQuery.cells.staticTexts["Avengers: Infinity War"].exists, "Failure: did not show the first movie name.")
    XCTAssertTrue(tablesQuery.cells.staticTexts["8.5"].exists, "Failure: did not show the first movie rating.")

    // Assert on second movie
    XCTAssertTrue(tablesQuery.cells.staticTexts["Bohemian Rhapsody"].exists, "Failure: did not show the second movie name.")
    XCTAssertTrue(tablesQuery.cells.staticTexts["8.4"].exists, "Failure: did not show the second movie rating.")

    // Assert on third movie
    XCTAssertTrue(tablesQuery.cells.staticTexts["Aquaman"].exists, "Failure: did not show the third movie name.")
    XCTAssertTrue(tablesQuery.cells.staticTexts["8.3"].exists, "Failure: did not show the third movie rating.")

    // Assert on fourth movie
    XCTAssertTrue(tablesQuery.cells.staticTexts["A Star Is Born"].exists, "Failure: did not show the fourth movie name.")
    XCTAssertTrue(tablesQuery.cells.staticTexts["8.2"].exists, "Failure: did not show the fourth movie rating.")
  }

}
