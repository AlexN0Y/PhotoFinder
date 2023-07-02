//
//  ViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 12.06.2023.
//

import UIKit

class MainPageViewController: UIViewController, MainPageView {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var searchController = UISearchController(searchResultsController: nil)
    var presenter: MainPageViewPresenter?
    private enum Constants {
        static let title = "Main"
        static let searchViewController = "SearchViewControllerv"
        static let categoryViewController = "CategoryViewController"
        static let listImage = "list.bullet"
        static let imageCellIdentifier = "PhotoCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.title
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem = searchBarButtonItem
        let listBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.listImage), style: .plain, target: self, action: #selector(listButtonTapped))
        navigationItem.leftBarButtonItem = listBarButtonItem
        setSearchController()
        configureCollectionView()
        presenter = MainPagePresenter(view: self)
        presenter?.getPhotos()
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    private func setSearchController() {
        searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search here..."
            searchController.searchBar.delegate = self
            definesPresentationContext = true
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
    
    
    @objc private func searchButtonTapped() {
        present(searchController, animated: true, completion: nil)
    }
    
    @objc private func listButtonTapped() {
        let categoryViewController = CategoryViewController.instantiate()
        self.navigationController?.pushViewController(categoryViewController, animated: true)
    }
    

}

extension MainPageViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let _ = searchController.searchBar.text
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true, completion: nil)
    }
}


extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfPhotos() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.imageCellIdentifier, for: indexPath) as? PhotoCell, let photo = presenter?.photoAtIndex(indexPath.row) {
            cell.configure(photoData: photo)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let imageVC = ImageViewController.instantiate() as? ImageViewController, let photo = presenter?.photoAtIndex(indexPath.row) {
            imageVC.photo = photo
            self.navigationController?.pushViewController(imageVC, animated: true)
        }
    }
    
}
