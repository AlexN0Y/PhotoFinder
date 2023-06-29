//
//  ImageViewController.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 25.06.2023.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet private weak var photoView: UIImageView!
    var photo: UnsplashPhoto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let photo = photo else {
            return
        }
        loadImage(from: photo.urls.full) { image in
            if let image = image {
                self.photoView.image = image
            } else {
                print("error")
            }
        }
    }
    
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
