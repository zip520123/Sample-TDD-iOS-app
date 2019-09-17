//
//  NetworkLayerMock.swift
//  MoviesTests
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import UIKit
import Movies

class NetworkLayerMock: Network {
  private let mockedData: [[String: String]]

  init(mockData: [[String: String]]) {
    self.mockedData = mockData

  }

  override func executeGetRequest(api: String, completionBlock: @escaping ((Data?) -> ())) {

    let data = toJSONString(mockedData: self.mockedData)
    completionBlock(data)

  }

  func toJSONString(mockedData: [[String: String]]? ) -> Data? {
    if let arr = mockedData {
      let dat = try? JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted)
      return dat
    }
    return nil

  }



}
