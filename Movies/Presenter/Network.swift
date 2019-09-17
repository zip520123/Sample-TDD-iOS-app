//
//  Network.swift
//  Movies
//
//  Created by zip520123 on 2019/9/17.
//  Copyright © 2019 zip520123. All rights reserved.
//

import Foundation
open class Network : NSObject{
  open func executeGetRequest(api: String, completionBlock: @escaping ((Data?)-> ()) ) {
    let env = ProcessInfo.processInfo.environment
    var baseUrl = ""

    if env["isUITest"] != nil {
      baseUrl = ProcessInfo.processInfo.environment["BASEURL"]!

    } else {
      baseUrl = "https://api.example.com"
    }

    guard let gitUrl = URL(string: baseUrl + api) else {return}

    let session = URLSession(configuration: URLSessionConfiguration.default)
    let dataTask = session.dataTask(with: gitUrl) { data, response, error in
      guard let data = data else {return}
      do {
        if let returnData = String(data: data, encoding: .utf8) {
          print(returnData)
        } else {
          print("empty")
        }
      }

      if error != nil {
        print("err", error!)
      }
      completionBlock(data)
    }

    dataTask.resume()

  }
}
