//
//  UnsplashPhoto.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 29.06.2023.
//

import Foundation

struct UnsplashPhoto: Decodable {
    let id: String
    let width: Int
    let height: Int
    let color: String
    let urls: PhotoUrls
    let links: PhotoLinks
    let likes: Int
    let description: String?

    struct PhotoUrls: Decodable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
    
    struct PhotoLinks: Decodable {
        let `self`: String
        let html: String
        let download: String
        let downloadLocation: String

        enum CodingKeys: String, CodingKey {
            case `self`
            case html
            case download
            case downloadLocation = "download_location"
        }
    }
}
