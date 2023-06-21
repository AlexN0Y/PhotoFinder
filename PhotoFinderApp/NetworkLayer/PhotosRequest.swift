//
//  PhotosRequest.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 20.06.2023.
//

import Foundation

let baseURL = "https://api.unsplash.com"

private let unsplashAPIKey = "api_key"

struct PhotosRequest: DataRequest {

    typealias Response = [Any]
    
    var url: String {
        return baseURL + "/photos"
    }
    
    var method: HTTPMethod {
        .get
    }

    var headers: [String : String] {
        ["Authorization": "Client-ID \(unsplashAPIKey)"]
    }

    var queryItems: [String : String] {
        [:]
    }
    
    func decode(_ data: Data) throws -> [Any] {
        return []
    }
    
}
