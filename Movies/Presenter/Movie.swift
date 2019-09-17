//
//  Movie.swift
//  Movies
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import Foundation
struct Movie : Decodable {
  let name : String?
  let rating : String?

  enum CodingKeys : String, CodingKey {
    case name
    case rating = "ratting"
  }

}
