//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let data = photoImageView.image?.pngData() else { fatalError("error 1 in savePhoto in PhotoDetailViewController") }
        guard let titleText = titleTextField.text else { fatalError("error 2 in savePhoto in PhotoDetailViewController") }
        
        if let photo = photo {
            photoController?.update(photo: photo, newData: data, newTitle: titleText)
        } else {
            photoController?.create(photo: Photo(imageData: data, title: titleText))
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .blue
        }
    }
    
    func updateViews() {
        guard let photo = photo else { fatalError("something wrong here bro, updateViews() in PhotoDetailViewController") }
        
        photoImageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
