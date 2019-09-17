//
//  MoviesListPresenterTest.swift
//  MoviesTests
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import XCTest
@testable import Movies
class MoviesListModelMock: MoviesListModel {
  var mockMovies: [Movie] = []
  convenience init(mockMovies: [Movie]) {
    self.init(networkLayer: Network())
    self.mockMovies = mockMovies
  }

  override func fetchMovies() {
    self.fetchCallBack?(true , mockMovies)
  }
}



class MoviesListPresenterTest: XCTestCase {

  func testGetMovies() {
    let model = [Movie(name: "n0", rating: "0"), Movie(name: "n1", rating: "1")]

    let presenter = MoviesListPresenter(moviesListModel: MoviesListModelMock(mockMovies: model))

    presenter.fetchMovies()

    XCTAssert(presenter.movieName(index: 0) == "n0")
    XCTAssert(presenter.movieName(index: 1) == "n1")

    XCTAssert(presenter.moviesRatting(index: 0) == "0")

    XCTAssert(presenter.moviesRatting(index: 1) == "1")



  }

}
