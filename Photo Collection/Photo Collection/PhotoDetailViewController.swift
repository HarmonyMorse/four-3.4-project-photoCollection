//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    let imagePicker = UIImagePickerController()
//    imagePicker.allowsEditing = true
//    imagePicker.delegate = self
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
        imagePicker.delegate = self
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let data = photoImageView.image?.pngData() else { return }
        guard let titleText = titleTextField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, newData: data, newTitle: titleText)
        } else {
            photoController?.create(photo: Photo(imageData: data, title: titleText))
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        present(imagePicker, animated: true)
        
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
//         guard let photo = photo else { fatalError("something wrong here bro, updateViews() in PhotoDetailViewController") }
        
        if let photo = photo {
            
            photoImageView.image = UIImage(data: photo.imageData)
            titleTextField.text = photo.title
            
        } else {
            
            photoImageView.image = nil
            titleTextField.text = ""
            
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        info[UIImagePickerController.InfoKey]
        guard let photoInfo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//        print(info[UIImagePickerController.InfoKey.editedImage])
//        let selectedImage = info
        photoImageView.image = photoInfo
        imagePicker.dismiss(animated: true)
    }
    
}

/*
 PHPhotoLibrary.requestAuthorization({
        (newStatus) in
          if newStatus ==  PHAuthorizationStatus.authorized {
           /* do stuff here */
     }
 })
 */
