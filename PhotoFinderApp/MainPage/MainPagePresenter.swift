//
//  MainPagePresenter.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import Foundation

class MainPagePresenter: MainPageViewPresenter {
    
    private weak var view: MainPageView?
    private let networkService = DefaultNetworkService()
    private var allPhotos: [UnsplashPhoto] = []
    private var photos: [UnsplashPhoto] = []

    required init(view: MainPageView) {
        self.view = view
    }
    
    func getPhotos() {
        let request = PhotosRequest()
        networkService.request(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self?.allPhotos = photos
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
    
    func searchPhotos(with term: String) {
            if term.isEmpty {
                photos = allPhotos
            } else {
                photos = allPhotos.filter { ($0.description ?? "").lowercased().contains(term.lowercased()) }
            }
            view?.reloadCollectionView()
    }
}

