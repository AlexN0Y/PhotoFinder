//
//  MainPagePresenter.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 23.06.2023.
//

import Foundation

class MainPagePresenter {
    weak private var mainPageView: MainPageView?

    // Initialize with the view and any services
    init(view: MainPageView /*, networkService: NetworkService */) {
        self.mainPageView = view
        // self.networkService = networkService
    }

    // Functions that the View will call, for instance viewDidLoad
    func viewDidLoad() {
        //mainPageView?.setNavigationTitle("Main")
    }

    // ... more presenter methods
}
