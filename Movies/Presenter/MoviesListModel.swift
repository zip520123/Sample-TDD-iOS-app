//
//  MoviesListModel.swift
//  Movies
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import Foundation

open class MoviesListModel {
  private let networkLayer: Network
  var fetchCallBack : ((_ success: Bool,_ movies: [Movie])->())?

  init(networkLayer: Network) {
    self.networkLayer = networkLayer
  }

  open func fetchMovies() {
    networkLayer.executeGetRequest(api: "/Movies") {[weak self] (data) in
      if let moviesData = data {
        let movieParser = MoviesParser()
        let movies = movieParser.parseMovies(data: moviesData)
        self?.fetchCallBack?(true, movies)

      } else {
        self?.fetchCallBack?(false, [])
      }
    }
  }

}
