//
//  ViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 12.06.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //here
    var searchController = UISearchController(searchResultsController: nil)
    private enum Constants {
        static let title = "Main"
        static let searchViewController = "SearchViewControllerv"
        static let categoryViewController = "CategoryViewController"
        static let listImage = "list.bullet"
        static let imageCellIdentifier = "PhotoCell"
        static let numberOfCells = 30
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.title
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem = searchBarButtonItem
        let listBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.listImage), style: .plain, target: self, action: #selector(listButtonTapped))
        navigationItem.leftBarButtonItem = listBarButtonItem
        //
        searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search here..."
            searchController.searchBar.delegate = self
            definesPresentationContext = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.imageCellIdentifier)
        
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
        return Constants.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.imageCellIdentifier, for: indexPath) as! PhotoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageVC = ImageViewController.instantiate()
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
}
