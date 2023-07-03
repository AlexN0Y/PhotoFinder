//
//  UnsplashSearchRequest.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 20.06.2023.
//

import Foundation

struct UnsplashPhotoResponse: Decodable {
    let results: [UnsplashPhoto]
}

struct UnsplashSearchRequest: DataRequest {
    
    typealias Response = UnsplashPhotoResponse
    
    var url: String {
        return "https://api.unsplash.com/search/photos"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String : String] {
        return ["Authorization": "Client-ID \(GlobalConstants.accessKey ?? "")"]
    }
    
    var queryItems: [String : String]
    
    init(query: String, perPage: Int = 20) {
        queryItems = ["query": query, "per_page": "\(perPage)"]
    }
}
