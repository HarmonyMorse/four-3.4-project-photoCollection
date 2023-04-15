//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, newData: Data, newTitle: String) {
        
        guard let place = photos.firstIndex(of: photo) else { fatalError("Could not find photo \(photo).")}
        
        photos[place].imageData = newData
        photos[place].title = newTitle
        
    }
    
}
