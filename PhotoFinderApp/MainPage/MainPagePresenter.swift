//
//  MainPagePresenter.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 23.06.2023.
//

import Foundation

class MainPagePresenter: MainPageViewPresenter {
    
    weak var view: MainPageView?
    let networkService = DefaultNetworkService()
    var photos: [UnsplashPhoto] = []

    required init(view: MainPageView) {
        self.view = view
    }
    
    func getPhotos() {
        let request = PhotosRequest()
        networkService.request(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self?.photos = photos
                    self?.view?.reloadCollectionView()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func numberOfPhotos() -> Int {
        return photos.count
    }
    
    func photoAtIndex(_ index: Int) -> UnsplashPhoto? {
        return photos[index]
    }
}

