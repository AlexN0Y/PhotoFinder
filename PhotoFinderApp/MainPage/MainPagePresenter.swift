//
//  MainPagePresenter.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 23.06.2023.
//

import Foundation

class MainPagePresenter {
    weak var view: MainPageViewProtocol?
    
    var numberOfCells: Int {
        return 30
    }
    
    func viewDidLoad() {
    }
    
    func updateSearchResults(for text: String?) {
    }
    
    func cancelButtonClicked() {
    }
    
    func cellData(for index: Int) -> String {
        // Get cell data
        return "Cell Data"
    }
}

