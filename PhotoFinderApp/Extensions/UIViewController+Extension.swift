//
//  UIViewController+Extension.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 17.06.2023.
//

import UIKit

extension UIViewController {
    class func instantiate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
