//
//  ChosenCategoryViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import UIKit

class ChosenCategoryViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private let networkService = DefaultNetworkService()
    var controllersTitle: String = ""
    private var photos: [UnsplashPhoto] = []
    
    private enum Constants {
        static let imageCellIdentifier = "PhotoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = controllersTitle
        configureCollectionView()
        getPhotos()
    }
    
    private func getPhotos() {
        let searchRequest = UnsplashSearchRequest(query: controllersTitle)
        networkService.request(searchRequest) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.photos = response.results
                case .failure(let error):
                    print("Failed to get photos: \(error)")
                }
                self?.collectionView.reloadData()
            }
        }
    }
    
    private func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width
        let cellWidth = (width - 21) / 2.0
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        collectionView.collectionViewLayout = layout
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: Constants.imageCellIdentifier, bundle: nil), forCellWithReuseIdentifier: Constants.imageCellIdentifier)
    }

}

extension ChosenCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.imageCellIdentifier, for: indexPath) as? PhotoCell {
            cell.configure(photoData: photos[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let imageVC = ImageViewController.instantiate() as? ImageViewController {
            imageVC.photo = photos[indexPath.row]
            self.navigationController?.pushViewController(imageVC, animated: true)
        }
    }
    
}
