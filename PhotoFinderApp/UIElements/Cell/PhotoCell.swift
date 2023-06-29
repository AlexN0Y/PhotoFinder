//
//  PhotoCell.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 23.06.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(photoData: UnsplashPhoto) {
        loadImage(from: photoData.urls.small) { image in
            if let image = image {
                self.photoView.image = image
            } else {
                print("error")
            }
        }
        DispatchQueue.main.async {
            self.titleLabel.text = "Photo Photo Photo Photo Photo v vPhoto Photo"
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
