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

enum NetworkError : Error {
    case internetUnavailabilityError
    case decodingError
    case dataNotFound
    case invalidUrl
    case domainError

}
