//
//  CategoryViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import UIKit

protocol CategoryView: AnyObject {
    func reloadData()
}

class CategoryViewController: UIViewController, CategoryView {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: CategoryViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter = CategoryPresenter()
        presenter?.attachView(view: self)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCategories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = presenter?.category(at: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = presenter?.didSelectCategory(at: indexPath.row)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
