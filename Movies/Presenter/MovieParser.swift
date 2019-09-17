//
//  MovieParser.swift
//  Movies
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import Foundation
class MoviesParser {
  
  func parseMovies(data: Data) -> [Movie] {

    do {
      let jsonArray = try JSONDecoder().decode([Movie].self, from: data)
      return jsonArray

    } catch let error as NSError {
      print(error)

      return []
    }

    
  }
}
