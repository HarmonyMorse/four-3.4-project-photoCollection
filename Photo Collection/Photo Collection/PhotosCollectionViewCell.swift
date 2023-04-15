//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    private func updateViews() {
        
        guard let photo = photo else { return }
        
        titleLabel.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
        
    }
    
}
