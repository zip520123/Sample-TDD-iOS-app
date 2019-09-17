//
//  HTTPStubs.swift
//  SwiftStubsUITests
//
//  Created by Shashikant Jagtap on 18/11/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import Foundation
import Swifter

enum HTTPMethod {
  case POST
  case GET
}

class HTTPDynamicStubs {

  var server = HttpServer()

  func setUp() {
    try! server.start()
  }

  func tearDown() {
    server.stop()
  }


  public func setupStub(url: String, filename: String, method: HTTPMethod = .GET) {
    let testBundle = Bundle(for: type(of: self))

    let fileUrl = testBundle.url(forResource: filename, withExtension: "json")!

    let data = try! Data(contentsOf: fileUrl, options: .uncached)


    let json = dataToJSON(data: data)

    // Swifter makes it very easy to create stubbed responses
    let response: ((HttpRequest) -> HttpResponse) = { _ in
      return HttpResponse.ok(.json(json as AnyObject))
    }

    switch method {
    case .GET : server.GET[url] = response
    case .POST: server.POST[url] = response
    }
  }

  func dataToJSON(data: Data) -> Any? {
    do {
      return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    } catch let myJSONError {
      print(myJSONError)
    }
    return nil
  }
}

struct HTTPStubInfo {
  let url: String
  let jsonFilename: String
  let method: HTTPMethod
}
