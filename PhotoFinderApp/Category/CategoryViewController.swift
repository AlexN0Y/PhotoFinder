//
//  CategoryViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    private let categories = ["Nature", "Cars", "Architecture", "Travel", "Fashion", "Abstract", "Underwater", "Macro"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            cell.textLabel?.text = categories[indexPath.row]
            return cell
        }

        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCategory = categories[indexPath.row]
            let vc = ChosenCategoryViewController.instantiate() as! ChosenCategoryViewController
            vc.controllersTitle = selectedCategory
            self.navigationController?.pushViewController(vc, animated: true)
        }
}
