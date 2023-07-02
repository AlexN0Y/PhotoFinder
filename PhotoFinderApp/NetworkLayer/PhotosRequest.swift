//
//  PhotosRequest.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 20.06.2023.
//

import Foundation

let baseURL = "https://api.unsplash.com"

struct PhotosRequest: DataRequest {

    typealias Response = [UnsplashPhoto]
    
    var url: String {
        return baseURL + "/photos"
    }
    
    var method: HTTPMethod {
        .get
    }

    var headers: [String : String] {
        ["Authorization": "Client-ID \(GlobalConstants.accessKey ?? "")"]
    }

    var queryItems: [String : String] {
        [:]
    }
    
}

