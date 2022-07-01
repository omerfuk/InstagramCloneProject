//
//  UploadViewController.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit
import Firebase

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
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        
        //if you want to save your image to storage, you should convert it do data
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            
            imageReferance.putData(data, metadata: nil) { metadata, error in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Errorrr")
                }
                else{
                    
                    imageReferance.downloadURL { url, error in
                        
                        if error == nil {
                            
                            let imageUrl  = url?.absoluteString
                            print(imageUrl)
                            self.makeAlert(title: "Success", message: "Success")
                            
                            
                            //Database
                            
                            let firestoreDatabes = Firestore.firestore()
                            var firestoreReferance:DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy": Auth.auth().currentUser!.email, "postComment": self.commentTextfield.text!, "date": FieldValue.serverTimestamp(), "likes": 0] as [String : Any]
                            
                            firestoreReferance = firestoreDatabes.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                                }
                                else{
                                    self.imageView.image = UIImage(named: "clickMe")
                                    self.commentTextfield.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                        }
                    }
                    
                }
            }
        }
    }
    

}


extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
