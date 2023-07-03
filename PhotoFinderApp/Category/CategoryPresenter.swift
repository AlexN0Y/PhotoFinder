//
//  CategoryPresenter.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 22.06.2023.
//

import Foundation

protocol CategoryViewPresenter {
    var numberOfCategories: Int { get }
    func category(at index: Int) -> String
    func didSelectCategory(at index: Int) -> ChosenCategoryViewController
    func attachView(view: CategoryView)
}

class CategoryPresenter: CategoryViewPresenter {
    
    private weak var view: CategoryView?
    
    private let categories = ["Nature", "Cars", "Architecture", "Travel", "Fashion", "Abstract", "Underwater", "Macro"]

    var numberOfCategories: Int {
        return categories.count
    }

    func category(at index: Int) -> String {
        return categories[index]
    }
    
    func attachView(view: CategoryView) {
        self.view = view
    }

    func didSelectCategory(at index: Int) -> ChosenCategoryViewController {
        let selectedCategory = categories[index]
        let vc = ChosenCategoryViewController.instantiate() as! ChosenCategoryViewController
        vc.controllersTitle = selectedCategory
        return vc
    }
}
