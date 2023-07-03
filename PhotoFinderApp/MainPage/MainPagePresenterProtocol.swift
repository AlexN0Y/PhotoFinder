//
//  MainPagePresenterProtocol.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import Foundation

protocol MainPageViewPresenter {
    init(view: MainPageView)
    func getPhotos()
    func numberOfPhotos() -> Int
    func photoAtIndex(_ index: Int) -> UnsplashPhoto?
    func searchPhotos(with term: String)
}
