//
//  CategoryViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 18.06.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    private let categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6", "Category 7", "Category 8", "Category 9"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // return the number of categories
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // create a cell for each category
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            cell.textLabel?.text = categories[indexPath.row]
            return cell
        }
        
        // UITableViewDelegate methods
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // handle when a category is selected
            let selectedCategory = categories[indexPath.row]
            print("Selected Category: \(selectedCategory)")
        }
}
