//
//  ViewController.swift
//  InstagramCloneProject
//
//  Created by Ömer Faruk Kılıçaslan on 30.06.2022.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else{
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }
        else{
            
        }
        
        
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if emailTextfield.text != "" && passwordTextfield.text != ""{
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authdata, error in
                
                if error != nil {
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            self.makeAlert(title: "Warning", message: "Username/Password")
            
            
        }
        
    }
    
}




