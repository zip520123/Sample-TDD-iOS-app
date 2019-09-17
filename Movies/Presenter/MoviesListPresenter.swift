//
//  MoviesListPresenter.swift
//  Movies
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import Foundation
class MoviesListPresenter {
  let moviesListModel : MoviesListModel
  var movies = [Movie]()
  var didFetchMovies: (()->())?
  
  init(moviesListModel: MoviesListModel) {
    self.moviesListModel = moviesListModel
    self.moviesListModel.fetchCallBack = {[weak self] success, movies in
      self?.movies = movies
      self?.didFetchMovies?()
    }

  }

  func fetchMovies() {
    moviesListModel.fetchMovies()
  }

  func moviesCount() -> Int {
    return movies.count
  }

  func movieName(index: Int) -> String {
    return movies[safe: index]?.name ?? ""
  }

  func moviesRatting(index: Int) -> String {
    return movies[safe: index]?.rating ?? ""
  }


}

extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

