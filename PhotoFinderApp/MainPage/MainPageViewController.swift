//
//  ViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 12.06.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    private enum Constants {
        static let title = "Main"
        static let searchViewController = "SearchViewControllerv"
        static let categoryViewController = "CategoryViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.title
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem = searchBarButtonItem
        let listBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = listBarButtonItem
        //self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }


}

