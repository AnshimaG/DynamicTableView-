//
//  Constants.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import Foundation

struct ApiEndPoints{
    static let factApiUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
}

enum Font {
  static let neue     = "Helvetica Neue"
  static let medium   = "HelveticaNeue-Medium"
  static let regular  = "HelveticaNeue-Regular"
}

enum Size {
  static let image = (width: Float(120), height: Float(120))
}

enum Message {
  static let initialLoading = "Please wait..."
  static let pullToRefresh = "Fetching"
  static let internetConnectivity = "Please check your internet connection"
}

enum Height {
  static let factTableEstimated: Float = 100
  static let factTableCellMinimum: Float = 100
  static let margin: Float = 8
}

//Error Handling

enum NetworkError : Error {
    case internetUnavailabilityError
    case decodingError
    case invalidUrl
    case dataFetchError
    
    
    var reason: String {
    switch self {
    case .internetUnavailabilityError:
      return "No Internet connection, \n Please check connectivity"
    case .decodingError:
      return "An error occurred while decoding data \n Please try again"
    case .invalidUrl:
      return "invalid url"
    case .dataFetchError:
        return "Error while fetching data"
        }
 }
}

