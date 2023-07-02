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
    @IBOutlet private weak var descriptionLabel: UILabel!
    
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
        
        DispatchQueue.main.async {
            self.descriptionLabel.text = photo.description
        }
        photoView.isUserInteractionEnabled = true
        let interaction = UIContextMenuInteraction(delegate: self)
        photoView.addInteraction(interaction)

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

extension ImageViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            let save = UIAction(title: "Save Image", image: UIImage(systemName: "square.and.arrow.down")) { action in
                if let image = self.photoView.image {
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
                }
            }
            return UIMenu(title: "", children: [save])
        }
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}
