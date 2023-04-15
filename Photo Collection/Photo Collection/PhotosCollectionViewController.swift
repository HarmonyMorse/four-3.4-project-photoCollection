//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "photoCellToDetailView" {
            
            let destVC = segue.destination as? PhotoDetailViewController
            
            guard let number = self.collectionView.indexPathsForSelectedItems?.first?.item else { fatalError("index path messed up in photoCellToDetailView segue") }
            
            destVC?.themeHelper = themeHelper
            destVC?.photoController = photoController
            destVC?.photo = photoController.photos[number]
            
        } else if segue.identifier == "addToDetailView" {
            
            let destVC = segue.destination as? PhotoDetailViewController
            
            destVC?.themeHelper = themeHelper
            destVC?.photoController = photoController
            
        } else if segue.identifier == "collectionViewToThemePicker" {
            
            let destVC = segue.destination as? PhotoDetailViewController
            
            destVC?.themeHelper = themeHelper
            
        } else { fatalError("segue messed up") }
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }

        // Configure the cell

        let photo = photoController.photos[indexPath.item]
        
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        if theme == "Dark" {
            themeHelper.setThemePreferenceToDark()
        } else {
            themeHelper.setThemePreferenceToBlue()
        }
    }
    
}
