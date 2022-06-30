//
//  UploadViewController.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var commentTextfield: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(tapGesture)


    }
    
    @objc func chooseImage() {
        
        //Selecting image, accessing to user library
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        
    }
    

}


extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
